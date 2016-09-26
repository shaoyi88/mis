<section id="feature" >
        <div class="container">
           <div class="center wow fadeInDown">
                <h2>入驻流程</h2>
            </div>

            <div class="row">
                {foreach $stepInfo as $v}
                <p style="text-align:center;">{$v['step_content']}</p>
                {/foreach}
            </div>    
        </div>
    </section>