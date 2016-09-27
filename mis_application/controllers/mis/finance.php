<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Finance extends MIS_Controller
{
	protected function initialize()
	{
		parent::initialize();
		checkMisLogin();
	}

	public function enterprise()
	{
		$data = array();
        if(checkRight('finance_enterprise') === FALSE){
        	$this->showView('denied', $data);
        	exit;
        }
        $this->load->model('MIS_Enterprise');
      	$offset = 0;
      	$pageUrl = '';
      	page(formatUrl('finance/enterprise').'?', $this->MIS_Enterprise->getCount(), PER_COUNT, $offset, $pageUrl);
      	$list = $this->MIS_Enterprise->getList($offset, PER_COUNT);
      	$enterpriseList = $dataList = array();
      	foreach($list as $item){
      	    $dataList[$item['enterprise_id']] = $item;
      	    $enterpriseList[] = $item['enterprise_id'];
      	}
      	$infoList = $this->MIS_Enterprise->getBuildingFee(implode(',', $enterpriseList));
        foreach($infoList as $item){
            $dataList[$item['enterprise_id']]['building'][] = $item['building_floor'].'层-'.$item['building_room'];
            $dataList[$item['enterprise_id']]['area'] = isset($dataList[$item['enterprise_id']]['area']) ?
                                                        ($item['building_actual_area']+$dataList[$item['enterprise_id']]['area']) : $item['building_actual_area'];
            $dataList[$item['enterprise_id']]['rent_fee'] = isset($dataList[$item['enterprise_id']]['rent_fee']) ?
                                                            ($item['building_actual_area']*$item['building_rent_fee']+$dataList[$item['enterprise_id']]['rent_fee']) : $item['building_actual_area']*$item['building_rent_fee'];
            $dataList[$item['enterprise_id']]['property_fee'] = isset($dataList[$item['enterprise_id']]['property_fee']) ?
                                                            ($item['building_actual_area']*$item['building_property_fee']+$dataList[$item['enterprise_id']]['property_fee']) : $item['building_actual_area']*$item['building_property_fee'];
        }
        $data['dataList'] = $dataList;
        $data['pageUrl'] = $pageUrl;
        $this->showView('financeEnterprise', $data);
	}

	public function fee()
    {
        $data = array();
        if(checkRight('finance_fee') === FALSE){
            $this->showView('denied', $data);
            exit;
        }
        $this->load->model('MIS_Fee');
        $keyword = $this->input->get();
        $offset = 0;
        $pageUrl = '';
        page(formatUrl('finance/fee'), $this->MIS_Fee->getCount($keyword), PER_COUNT, $offset, $pageUrl);
        $list = $this->MIS_Fee->getList($keyword, $offset, PER_COUNT);
        $feeInfo = $this->MIS_Fee->getEnterpriseFee();
        $dataList = array();
        foreach($list as $item){
            $item['curPay'] = $item['rent_fee']+$item['property_fee']+$item['water_fee_unit_price']*$item['water_fee_num']+$item['elec_fee_unit_price']*$item['elec_fee_num'];
			if(isset($feeInfo[$item['enterprise_id']])){
				$item['fee'] = $feeInfo[$item['enterprise_id']]['fee'];
			}else{
				$item['fee'] = 0;
			}
            if($item['pay_status'] == 0){
                $item['otherPay'] = $item['fee']-$item['curPay'];
                $item['totalPay'] = $item['curPay']+$item['otherPay'];
            }else{
                $item['totalPay'] = $item['otherPay'] = $item['fee'];
            }
            $item['curPay'] = round($item['curPay'],2);
            $item['otherPay'] = round($item['otherPay'],2);
            $item['totalPay'] = round($item['totalPay'],2);
            $dataList[] = $item;
        }
        $data['pageUrl'] = $pageUrl;
        $data['dataList'] = $dataList;
        $data['keyword'] = $keyword;
        $this->showView('financeFee', $data);
    }
}