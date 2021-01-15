//https://github.com/kelaberetiv/TagUI/blob/master/src/test/positive_test.tag
//tagui bilibili.tag searchKeys.csv -q

https://bilibili.com

echo `title()` `keyword`
type (//*[@id="nav_searchform"]/input) as [clear]`keyword`
click (//*[@id="nav_searchform"]/div/button)

popup search.bilibili.com
    {
    wait
    echo `url()`
    cntItm = count('//*[@id="all-list"]/div[1]/div[2]/ul/li')
    for n from 1 to cntItm
        read (//*[@id="all-list"]/div[1]/div[2]/ul/li[`n`]/div/div[3]/span[3]) to upDate
        if upDate equal to "2020-01-10"
            //read (//*[@id="all-list"]/div[1]/div[2]/ul/li[`n`]/a/div/span[1]) to tag_rb
            click (//*[@id="all-list"]/div[1]/div[2]/ul/li[`n`]/div/div[1]/a)
            break
    }

popup video
    {
    wait
    echo `url()`
    click (//*[@id="bilibiliPlayer"]/div[1]/div[1]/div[10]/div[2]/div[2]/div[1]/div[1]/button)
    wait 60
    js r = Math.ceil(Math.random()*60)
    echo `r`s
    wait r
    //click (//*[@id="v_upinfo"]/div[2]/div[1]/a[1])
    }
