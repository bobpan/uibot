//https://github.com/kelaberetiv/TagUI/blob/master/src/test/positive_test.tag

// Visit the webpage
//https://weixin.sogou.com
https://mp.weixin.qq.com/s?src=11&timestamp=1609608308&ver=2804&signature=SFuX2vVaDoyFGzlXXg0cE8fo8AoIovbJEV9es6i8ri04Cz9iIN3QK5LieybwNRl8-qhG9jX5sXb2lfgPHSeB8K1s0mYP47kIdCAoZvCrU2VkmL6sR4PCbNNPUKIT6FvP&new=1
echo `title()`
//type query as [clear]乐曲多[enter]
snap page to demo_start.png


// Save the text from the element using XPath and calls it 'em_weixinhao',
// then show it on the console
//read (//*[@id="sogou_vr_11002301_box_0"]/div/div[2]/p[2]/label) to em_weixinhao
//echo `em_weixinhao`


//click (//*[@id="sogou_vr_11002301_box_0"]/dl[2]/dd/a)
// Wait 3 seconds to give the download time to complete on slow networks 
wait 3

// test title function
echo `title()`
//if title() contains `em_weixinhao`
//    snap element to demo_`em_weixinhao`.png
snap page to demo_0.png

//click (//*[@id="js_content"]/p[2]/span/em/strong/a)
snap page to demo_1.png

//move (//*[@id="js_related_container"]/div/div/div[1])
snap page to demo_2.png

// Wait 15 seconds to give the download time to complete on slow networks 
wait 5
