//https://github.com/kelaberetiv/TagUI/blob/master/src/test/positive_test.tag

// Visit the webpage
//https://weixin.sogou.com
https://mp.weixin.qq.com/s/7zHiUfXtaNAwA-Wrb80hLA

echo `title()`
//type query as [clear]乐曲多[enter]
//snap page to demo_start.png


// Save the text from the element using XPath and calls it 'em_weixinhao',
// then show it on the console
//read (//*[@id="sogou_vr_11002301_box_0"]/div/div[2]/p[2]/label) to em_weixinhao
//echo `em_weixinhao`



// test title function
echo `title()`

read (//*[@id="js_name"]) to js_name
echo `js_name`

click (//*[@id="js_name"])
wait 9
snap page to /logs/js_name.png
wait 100

move (//*[@id="js_related_container"])
snap page to /logs/js_related_container.png
wait 50

move (//*[@id="js_name"])
wait 50

move (//*[@id="js_related_container"])
wait 50

move (//*[@id="js_name"])
snap page to /logs/end.png
wait 50
