//https://github.com/kelaberetiv/TagUI/blob/master/src/test/positive_test.tag
//tagui bilibili.tag searchKeys.csv -q

https://search.bilibili.com

echo `keyword`
type search-keyword as [clear]`keyword`[enter]
click (//*[@id="server-search-app"]/div/div/div[2]/a)

wait
echo `url()`
snap page to search.png

cntItm = count('//*[@id="all-list"]/div[1]/div[2]/ul/li')
for n from 1 to cntItm
    read (//*[@id="all-list"]/div[1]/div[2]/ul/li[`n`]/div/div[3]/span[3]) to upDate
    read (//*[@id="all-list"]/div[1]/div[2]/ul/li[`n`]/div/div[3]/span[4]/a) to itmName
    echo `itmName`,`upName`,`upDate`

    if itmName equals to "`upName`"
        click (//*[@id="all-list"]/div[1]/div[2]/ul/li[`n`]/a)
        read (//*[@id="all-list"]/div[1]/div[2]/ul/li[`n`]/div/div[1]/a) to itmTitle
        echo `itmTitle`
        break

wait 5
popup video
    {
    wait
    echo `url()`
    snap page to video.png
    click (//*[@id="bilibiliPlayer"]/div[1]/div[1]/div[10]/div[2]/div[2]/div[1]/div[1]/button)
    wait 60
    js r = Math.ceil(Math.random()*60)
    echo `r`s
    wait `r` + 6.0
    //click (//*[@id="v_upinfo"]/div[2]/div[1]/a[1])
    }
