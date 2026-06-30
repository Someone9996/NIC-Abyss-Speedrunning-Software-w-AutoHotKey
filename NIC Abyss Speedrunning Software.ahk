#Requires AutoHotkey v2.0
#SingleInstance Force
;Persistent(1)
#Include FindText.ahk
CoordMode "Mouse", "Window"
CoordMode "Pixel", "Window"
SendMode "Event"
running:=false
terminate:=false
;Author - Someone9996
;Made 28/9/2025
sessionData:={
    success:0,
    failure:0,
    times:[]
}
execute(){
    startTime:=A_TickCount
    ;timer
    Tick(){
        SoundBeep(300,500)
        sleep 50
        SoundBeep(300,500)
        sleep 50
        SoundBeep(300,500)
        sleep 50 
        sessionData.failure++
        statisticUpdate() 
        skip()
        iterations:=0
        while (!detectNextturn()&&iterations<20){
            iterations++
            SoundBeep(100,200)
            Sleep 500
        }
        x:=2380
        y:=42
        MouseMove x,y,0
        MouseMove x,y-1,0
        Sleep 100
        MouseMove x,y,0
        MouseClick "Left"
        Sleep 1000
        x:=2008
        y:=1569
        MouseMove x,y,0
        MouseMove x,y-1,0
        Sleep 100
        MouseMove x,y,0
        MouseClick "Left"
        Sleep 1000
        x:=2262
        y:=1292
        MouseMove x,y,0
        MouseMove x,y-1,0
        Sleep 100
        MouseMove x,y,0
        MouseClick "Left"
        termination()
    }
    SetTimer Tick, (60000*3)
    ;define
    global running
    if (running){
        return
    }
    running:=true
    global terminate:=false
    ;setup
    SoundBeep(800,200)
    resetLimit:=15
    iterationLimit:=40
    hX:=A_ScreenWidth/2
    hY:=A_ScreenHeight/2
    iterationRoadblock(iterations){
        ToolTip iterations ;hX hY
        if (iterations>resetLimit){
           Tick()
        }
        if (iterations>iterationLimit){
            SoundBeep(1100,500)
            sleep 50
            SoundBeep(1100,500)
            sleep 50
            SoundBeep(1100,500)
            sleep 50
            MsgBox "Automation stopped! Unable to proceed to next step while starting a lobby."
            ExitApp()
        }
    }
    startCheck:=[
        {
            Click:[1260, 680],
            DebugClick:[600, 680],
            Coords:[[1417, 614],[1492, 720]],
            Image:"|<>*140$60.zzzzzzzzy3zzzzzzzzw3zzzzzzzzs1zzzzzzzzU0zzzzzzzy00zzzzzzzw00zzzzzzzs00zzzzzzzU00zzzzzzy000zzzzzzw000zzzzzzk000zzzzzzU000zzzzzy0000zzzzzw0000zzzzzk0000zzzzzU0000zzzzy00000zzzzw00000zzzzk00000zzzzU00000zzzy000000zzzs000000zzzk000000zzzU000000zzy0000000zzs0000000zzk0000000zz00000000zy00000000zs00000000zk00000000z000000000w000000000s000000000k000000000U000000000U00000000000000000000000000000U000000000U000000000k000000000s000000000w000000000z000000000zk00000000zs00000000zw00000000zz00000000zzk0000000zzs0000000zzw0000000zzz0000000zzzk000000zzzs000000zzzy000000zzzz000000zzzzk00000zzzzs00000zzzzy00000zzzzz00000zzzzzk0000zzzzzs0000zzzzzy0000zzzzzz0000zzzzzzk000zzzzzzw000zzzzzzy000zzzzzzzU00zzzzzzzs00zzzzzzzw00zzzzzzzz00zzzzzzzzU1zzzzzzzzs1zzzzzzzzw3U"
        },
        {
            Click:[2804, 240],
            DebugClick:[3100, 240],
            Coords:[[2074, 342],[2154, 383]],
            Image:"|<>*58$66.zk00000003zzks0D00zU3zzlw0D07zs3zzly0D0Dzy1zy1z0D0Tzz0Dy1zUD0zUzUDy1zkD1y0DUDy1zkD1w07kDy1zsD1w07kDy1zwD3s03sDy1xyD3s03sDy1wzD3s03sDy1wTj3s03sDy1wTz3s03sDy1wDz1w07kDy1w7z1w07kDy1w3z1y0DkDy1w1z0z0TUDy1w0z0Tzz0Dy1w0z0Dzy0Dy1w0T07zw0Dy1w0D01zk0Dy000000000Dy000000000Dzk00000003zzk00000003zzk00000003zTk00000001zU"
        },
        {
            Click:[2433, 356],
            DebugClick:[3100, 356],
            Coords:[[2074, 342],[2154, 383]],
            Image:"|<>*56$46.Q07U0Tk3s0S07zkDk1s1zzkzU7UDzzXz0S1z1zDy1sDk1wzs7Uy03vzkS3s0DjzVsT00Tyz7Vw01ztyS7k07zXxsT00Ty7zVw01zsTy3s0DjUzsDU0yy1zUz07vs3y1y0zDU7s3zzsy0TU7zz3s0y0DzsDU1s0Dy0U"
        },
        {
            Click:[2242, 890],
            DebugClick:[3100, 890],
            Coords:[[2666, 842],[2926, 920]],
            Image:"|<>*127$165.3zzzzzzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzz3zzkDzUTVz1y1zzVkz0zz0zksDUsTzs0TU1w7sT03zwA7U1zU1y40k33zy01s07Uy3k0DzU0s07s07k0008TzU0DU0S7kQ01zw0600S00S00013zwDVwS3kS7VwDzUDkC3kC3k60s8TzU07zkS3kw00zw3y3sC3sC3sD13zs00zk3sQ7007zUzUz1Uz1kT1s8Tz007k0T3Vs00zw7w7sA7sC3sD13zs00w03sAD007zUzUz1Uz1kT1s8Tz1zz0sTVVsDzzw7w7sA7sC3sD13zw7zsS3w8TUzzzUzkT1kT1kT1s8TzUSS3UTV3w3nzw7y1kS1kS3sD100Q01s03y0TU0DzUzk03k03kT1s803k0D00Tk7y01zw7z00z00y3sD100T01w13y0zs0DzUzw0Dw0DkT1s803y1zkMTs7zkDzw7zs7zs7y3sD1U"
        },
        {
            Click:[2220, 979],
            DebugClick:[3100, 979],
            Coords:[[2861, 198],[2941, 278]],
            Image:"|<>*57$68.zzzztzzzzzzzzzzwTzzzzzzzzzy7zzzzzzzzzz1zzzzzzzzzzUTzzzzzzzzzU7zzzzzzzzzk1zzzzzzzzzs0Tzzzzzzzzw07zzzzzzzzy01zzzzzzzzz00TzzzzzzzzU07zzzzzzzzU01zzzzzzzzk00Dzzzzzzzs000zzzzzzzw0000Dzzzzzy00000Tzzzzz000000zzzzzU000003zzzzk000000Dzzzs0000000zzzs00000003zzw00000000Tzy000000003zz000000000Tzk000000003zw000000000TzU000000003zw000000000TzU000000003zw000000000TzU000000007zy000000000zzk00000000Dzy000000001zzk00000000Dzy001z00003zzk00Tw0000zzz007zs0007zzs01zzU001zzz00Tzy000Tzzs07zzs003zzz01zzz000zzzs0Tzzs00Dzzz07zzzU01zzzs1zzzw00Tzzz0TzzzU07zzzw7zzzw01zzzzVzzzzU0TzzzwTzzzw03zzzzbzzzzU0zzzzzzzzzs0Dzzzzzzzzz03zzzzzzzzzs0zzzzzzzzzy0Dzzzzzzzzzk3zzzzzzzzzy0zzzzzzzzzzUDzzzzzzzzzw3zzzzzzzzzz0zzzzzzzzzzsDzzzzzzzzzy3zzzzzzzzzzkzzzzzzzzzzwDzzzzzzzzzzXzzzzzzzzzztU"
        },
        {
            Click:[1862, 1369], ; this selects the map
            DebugClick:[3100, 1363],
            Coords:[[1871, 208],[2032, 265]],
            Image:"|<>*87$156.zzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzz003zzzzzzzzzzzz0Tzzzzzzzzz000Tzzzzzzzzzzz0Tzzzzzzzzz0007zzzzzzzzzzz0Tzzzzzzzzz0003zzzzzzzzzzz0Tzzzzzzzzz0001zzzzzzzzzzz0Tzzzzzzzzz0000zzzzzzzzzzz0Tzzzzzzzzz0000Tzzzzzzzzzz0Tzzzzzzzzz0Dk0Dzzzzzzzzzz0Tzzzzzzz0T0Dw0Dzy0zy0Tz0T0Tzzzzz0w070Dy07zs07y0Tz0T0Tzzzzz0s070Dz07zU03z0Ty0T0Tzzzzz0k030DzU7z001z0Dy0T0Tzzzzz00010DzU7y000z0Dy0z0Tzzzzz00010DzU3w000TUDy0z0Tzzzzz01k10DzU3w0z0TUDw0z0Tzzzzz03s10Dzk3s1zUTU7w1z0Dzzzzz07w00Dzk3s3zUDk7w1z0Dzzzzz0Dw00Dzk3s3zUDk7s1z0Dzzzzz0Dw00Dzk3k000Dk3s3z0Dzzzzz0Dw00Dzk3k000Ds3s3z0Dzzzzz0Dw00DzU3k000Ds3s3z0Dzzzzz0Dw00DzU3k000Ds3k7z0Dzzzzz0Dw00DzU7k000Dw1k7y0Dzzzzy0Dw00Dz07k000Dw1k7y0Dzzzzy0Dw00Dz07k3zzzw1kDy0Dzzzzy0Dw00Dy07k3zzzw1UDy0Dzzzzy0Dw00Dw0Dk1zzzy0UDy0Dzzzzy0Dw00DU0Ds1zzzy0UTz0Dzzzzy0Dw00000Ts0zzzy00Tz0Dzzzzy0Dw00000zw0DVzz00Tz0Dzzzzy0Dw00001zw000zz00zz03zzzzy0Dw00003zy000zz00zz03zzzzy0Dw00007zz000TzU0zzU3zzzzy0Dw0000TzzU00zzU1zzU1zzzzy0Dw0003zzzs01zzU1zzk1zzzzy0Dw0zzzzzzz0Dzzzzzzw1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0000Dzzzzzzzzzzzzzzzzzzzzz0000Dzzzzzzzzzzzzzzzzzzzzz0000Dzzzzzzzzzzzzzzzzzzzzz0000DzzzzU"
        },
        {
            Click:[2241, 521],
            DebugClick:[3100, 521],
            Coords:[[1970,1641],[2062,1700]],
            Image:"|<>*93$83.U007zz0DzzzU7z000Dzs03zzw01y000TzU03zzk01w000zy003zz001s001zs003zw001k003zU7k7zk3s3UTzzz0Tk7zUDs31zzzw1zkDy0zs63zzzs7zUTw3zkA7zzzkDz0Ts7zU8DzzzUTz0zkDzUETzzz0zy1zUTz0Uzzzy1zw3z0zy11zzzw3zs7y1zw23zzzs7zkDw3zs47zzzkDzUTs7zk8DUzzUTz0zkDzUEM0Tz0zy1zUTz0U00Dy1zw3z0zy1000Dw3zs7y1zw2000Ts7zkDw3zs40y0TkDzUTs7zk83z0zUTz0zkDzUEDy1z0zy1zUTz0Uzw1y1zw3z0zy1zzw3w3zs7y1zw3zzs7s7zkDw3zs7zzkDkDzUTs7zkDzzUTUTz0zkDzUTzz0z0zy1zUTz0zzy1y1zw3z0zy1zzw3w3zs7y1zw3zzs7s7zkDw3zs7zzkDkDzUTs7zk0DzUTUTz0zkDzU0Tz0z0zy1zUTz00zy1y1zw3z0zy01zw3w3zs7y1zw03zsDs7zUDw3zk03zUTkDz0zs7zUM7z0zUDy1zk7z0k7w3zUTs3zkDw1U7k7z0TUDzUDk7U00Tz000TzU00DU00zy001zz000zU03zy007zz003zU0Tzz00TzzU0Dzs3zzz03zzzU1zU"
        },
        {
            Click:[2750, 1462],
            DebugClick:[3100, 1462],
            Coords:[[1970,1641],[2062,1700]],
            Image:"|<>*93$77.000Tk003zzU7y000zU007zw01w001z000Dzk01s003y000Tz001s007w000zw001zzkDs001zk3s3zzUTkDzzzUDs3zz1zUzzzy0zs7zy3z1zzzw3zkDzs7y3zzzs7zUDzkDw7zzzkDzUTzUTsDzzzUTz0zz1zkTzzz0zy1zy3zUzzzy1zw3zs7z1zzzw3zs7zkDy3zzzs7zkDzUTw7kTzkDzUTz1zsA0DzUTz0zy3zk007z0zy1zs7zU007y1zw3zkDz000Dw3zs7zUTy0T0Ds7zkDz1zw1zUTkDzUTy3zs7z0zUTz0zs7zkTy0z0zy1zkDzzzy1y1zw3zUTzzzw3w3zs7z1zzzzs7s7zkDy3zzzzkDkDzUTs7zzzzUTUTz0zkDzzzz0z0zy1zUTzzzy1y1zw3z0zzzzw3w3zs7y3zzzzs7s7zkDs7zs7zkDkDzUTkDzkDzUTUTz0zUTzUTz0z0zy1z0zz0zy1y1zw3y3zy1zw7w3zk7s7zw1zkDs7zUTkDzw3zUTk7z0zUTzs3y1zkDw1z0zzk3s3zUDk7y3zzk00DzU00Ds7zzk00Tz000zkDzzk01zz003zUTzzk0DzzU0Dz0zzzw1zzzU1zU"
        },
        {
            Click:[2250, 1825],
            DebugClick:[2230, 1880]
        }
    ]
    detectLobby(){
        lobbyImage:="|<>*84$54.zzzz0zzzzzzzU01zzzzzw000Dzzzzk0003zzzz00000zzzy00000Tzzw00000Dzzs000007zzk000003zzU000001zz0000000zy0000000Tw0000000Dw0000000Ds00000007s00000007k00000003k00000003k00000003U00000001U00000001U00000001U00000001000000000000000000000000000000000000000000000000000000000000000000000000U00000001U00000001U00000001U00000001k00000003k00000003k00000003s00000007s00000007w0000000Dw0000000Dy0000000Tz0000000zzU000001zzk000003zzs000007zzw00000Dzzy00000Tzzz00000zzzzk0003zzzzw000DzzzzzU01zzzzzzz0zzzzU"
        if (FindText(&imgX,&imgY,2396,75,2471,145,0.1,0.1,lobbyImage)){
            return true
        }else{
            return false
        }
    }
    detectIngame(){
        ingameImage:="|<>*153$373.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk00TzzzzzzzzzzzzUDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs003zzzzzzzzzzzzk7zzzzzzz0Tzzzzzzzzzzy0zzzzzzzzzs3zzzzzzzzzzzzw000Tzzzzzzzzzzzs3zzzzzzzUDzzzzzzzzzzz0Tzzzzzzzzw1zzzzzzzzzzzzy0007zzzzzzzzzzzw1zzzzzzzk7zzzzzzzzzzzUDzzzzzzzzy0zzzzzzzzzzzzz0001zzzzzzzzzzzy0zzzzzzzs3zzzzzzzzzzzk7zzzzzzzzz0TzzzzzzzzzzzzU000zzzzzzzzzzzz0Tzzzzzzw1zzzzzzzzzzzs3zzzzzzzzzUDzzzzzzzzzzzzk7w0DzzzzzzzzzzzUDzzzzzzy0zzzzzzzzzzzw1zzzzzzzzzk7zzzzzzzzzzzzs3zU7zzzzzzzzzzzk7zzzzzzz0Tzzzzzzzzzzy0zzzzzzzy3s3zzzzzzzzzzzzw1zs3zw1zzy0zzz0s3s3zk7zs00DzUTzzzz0Tk00Ty0zz0w1001zzzzzzzzzzzy0zw1zs0Dzk07zy041w0zs3zw007y01zzzy01s00Dk07zUQ0U00zzzzzzzzzzzz0Ty0zs01zU00zy000z0Tw1zy003y00Tzzy00Q007U00zk40k00TzzzzzzzzzzzUDz0Tk00TU00Ty000TUDw1zz001w007zzy006003U00Ts00M00Dzzzzzzzzzzzk7z0Ds00Ds007y000Dk3y0zzU00y001zzy003001s007w00A007zzzzzzzzzzzs3zU7s003w001z0007w1z0Tzk00S000Tzz003U00w001y03y003zzzzzzzzzzzw1z07s0w1z3w0z07U3y0zUTzz0Dy0D0Dzz0D3y0Tz3w0z03zs1zzzzzzzzzzzzy0003w1z0Tbz0TU7s1z0TUDzzU7z0Dk3zzUDtz0Dzbz0TU3zw0zzzzzzzzzzzzz0003w1zkDzzUDk7y0zk7k7zzk3z0Dw1zzk3zzU7zzzUDk3zy0TzzzzzzzzzzzzU001y0zs7zw07k3z0Ts3s7zzs1zU7y0Tzw0zzk3zzw07s1zz0Dzzzzzzzzzzzzk003z0003zk03s1zUDy1s3zzw0zk3z0Dzy03zs1zzk03w0zzU7zzzzzzzzzzzzs003zU001z001w0zk7z0Q1zzy0Ts3zU7zzU0Tw0zz001y0Tzk3zzzzzzzzzzzzw001zk000z000y0Ts3zUC1zzz0Dw1zk3zzk03y0Tz000z0Dzs1zzzzzzzzzzzzy0w0zs000T030T0Dw1zs70zzzU7y0zs1zzy00z0Dz030TU7zw0zzzzzzzzzzzzz0T0Dw000D0DUDU7y0zw10Tzzk3z0Tw0zzzk0DU7z0DUDk3zy0TzzzzzzzzzzzzUDk3y0zzzUDk7k3z0Tz0UTzzs1zU7y0Tzzy07k3zUDk7s1zz0Dzzzzzzzzzzzzk7s1z0TzzUDs3s1zUDzUEDzzw0zk3z0Dzzzk1s1zUDs3w0zzU7zzzzzzzzzzzzs3y0TU7zzk7w1w0zk7zk07zzy0Ts1zUDzzzy0w0zk7w1y0Tzk3zzzzzzzzzzzzw1z0Ds1zzs3w0z0Dk3zw07zzz0Dy0TU7zznz0S0Ts3w0z0Dzs1zzzzzzzzzzzzy0zk3w0DXw0w0TU3k1zy03zzzk3z07U7zzkT0DU7w0w0TU7zy0Tzzzzzzzzzzzz0Ts1z000y000Dk000zzU1zzzs07k003zzk00Dk0C000Dk3zz00zzzzzzzzzzzzUDy0TU00TU007w000Tzk1zzzw01w003zzk007s03U007s1zzU0Dzzzzzzzzzzzk7z0Ds007k003z000Dzs0zzzz00y003zzs007y01k003w0zzs07zzzzzzzzzzzs3zk3z007w021zk087zy0TzzzU0Tk03zzz007z00w021y0Tzw03zzzzzzzzzzzw1zs0zk07z070zw0A3zz0Tzzzs0Dw03zzzs07zk0T070z0Dzz01zzzzzzzzzzzzzzzzzz0TzsDzzzUTzzzUDzzzz0DzkDzzzz0Dzy0TsDzzzzzzs1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy03zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz01zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
        if (FindText(&imgX,&imgY,3456,1164,A_ScreenWidth,1285,0.1,0.1,ingameImage)){
            return true
        }else{
            return false
        }
    }
    detectNextturn(){
        nextturnImage:="|<>*156$264.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz3zzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzzzzzy3zzzz000Dzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzzzzzy3zzzz000Dzzzzzzzw1zzz0Tzzzzzzzzzzzzzzzzs3zzy7zy0z000Dzzzzzzzw1zzz0TzzzzzzzzzzzzzzzzU0zzw7zs0z000Dzzzzzzzw1zzz0Tzzzzzzzzzzzzzzzy00Tzw7zU0z000Dzzzzzzzw1zzz0Tzzzzzzzzzzzzzzzw00Dzw7w00z000Dzzzzzzzw1zzz0Tzzzzzzzzzzzzzzzw007zw7w00z0Tzzzzzzzzzw1zzz0Tzzzzzzzzzzzzzzzs007zwDw00z0TzzzzkDzzzw1zzz0TzzzzzzzsDzy1zzzs1k3zsDw00z0TzzkD03zzkQ1zzk00S0zk7s7UC1s0Tzzk7s3zsDw00z0Tzzk601zy041zzk00S0zk7s70C0k0Dzzk7w3zsDzw0z0Tzzk401zw001zzk00S0zk7s20S0U0Dzzk7w1zsTzw0z0Tzzk000zs001zzk00S0zk7s00S0007zzUDw1zkTzw0z0Tzzk000zk001zzk00S0zk7s00S0007zzUDw1zkTzw0z000zk0w0zk001zzk00S0zk7s0Dy07U7zzUDw1zkTzw0z000zk1y0zU3k1zzy0Ty0zk7s0Ty0Dk7zzUDw1zkTzw0z000zk3y0TU7s1zzy0Ty0zk7s0zy0Tk3zzUDy0zUzzw0z000zk3y0TUDw1zzy0Ty0zk7s1zy0Tk3zzUDy0zUzzw0z000zk3y0T0Dw1zzy0Ty0zk7s1zy0Tk3zzUDy0zUzzw0z000zk3y0T0Dw1zzy0Ty0zk7s1zy0Tk3zzUDy0zUzzw0z0Tzzk3y0T0Dw1zzy0Ty0zk7s1zy0Tk3zzUDy1zVzzw0z0Tzzk3y0T0Dw1zzy0Ty0zk7s1zy0Tk3zzUDw1z1zzw0z0Tzzk3y0T0Dw1zzy0Ty0zk7s1zy0Tk3zzUDw1z1zzw0z0Tzzk3y0T0Dw1zzy0Ty0zk7s1zy0Tk3zzUDw1z1zzw0z0Tzzk3y0T0Dw1zzy0Ty0zk7s1zy0Tk3zzUDw1z3zzw0z0Tzzk3y0T0Dw1zzy0Ty0zU7s1zy0Tk3zzk7w1y3zzw0z0Tzzk3y0T0Dw1zzy0Ty0TU7s1zy0Tk3zzk7s3y3zzw0z0Tzzk3y0TU7s1zzy0Ty0T07s1zy0Tk3zzk3s3y3zzw0z0007k3y0TU3k1zzz0Dy0C07s1zy0Tk3zzs1k3y3zs0000007k3y0TU001zzz00z0007s1zy0Tk3zzs007w7zs0000007k3y0Tk001zzz00T0007s1zy0Tk3zzw007w7zs0000007k3y0Ts001zzzU0T0087s1zy0Tk3zzy00Dw7zs0000007k3y0Tw021zzzU0TU0M7s1zy0Tk3zzz00Tw7zs0000007k3y0Ty061zzzs0Tk0s7s1zy0Tk3zzzU0zwDzs000zzzzzzzzzzUTzzzzy0zw3zzzzzzzzzzzzzs7zsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsDzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkTzzzzzU"
        if (FindText(&imgX,&imgY,3456,1164,A_ScreenWidth,1285,0.1,0.1,nextturnImage)){
            return true
        }else{
            return false
        }
    }
    detectReturn(){
        returnImage:="|<>*186$437.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0zzzzzzzk1zzzzk1zzzzzzzzy000Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs1zzzzzzzU3zzzzU3zzzzzzzzw0001zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzzzzz07zzzz07zzzzzzzzs0000zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU7zzzzzzy0Dzzzy0Dzzzzzzzzk0000Tzzzzzzy0Tzzzzzzzzzzzzzzzzzzzzy0Tzzzzzzzzzz0Dzzzzzzw0Tzzzw0TzzzzzzzzU0000Tzzzzzzw0zzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzy0Tzzzzzzs0zzzzs0zzzzzzzzz00000zzzzzzzs1zzzzzzzzzzzzzzzzzzzzzs1zzzzzzzzzzw0zzzzzzzk1zzzzk1zzzzzzzzy00000zzzzzzzk3zzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzs1zzzzzzzU3zzzzU3zzzzzzzzw00000zzzzzzzU7zzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzk3zzzzzzz07zzzz07zzzzzzzzs0zz01zzzzzzz0Dzzzzzzzzzzzzzzzzzzzzz0DzzzzzzzzzzU7zzzzzzy0Dzzzy0Dzzzzzzzzk1zz03zzzzzzy0Tzzzzzzzzzzzzzzzzzzzzy0Tzzzzzzzzzz0Dzzzzzzw0Tzzzw0TzzzzzzzzU3zz07zzzzzzw0zzzzzzzzzzzzzzzzzzzzzw0zzzzzzzzzzy0Tzzzzzzs0zzzzs0zzzzzzzzz07zy07zzkzzzs1zzzzzzzzzzzzzzzXzzzzzs1zzzz1zzzzzw0zzzkTzzk1yDzzk1yDzzzzzzy0Dzy0Dzs03zw000z0Dzk3zU3yDk1k0Tzzzw000zzU07zzzzs1zzs01zzU301zzU301zs0zzU00Tzw0Tz001zs001y0TzU7z07UTU200Dzzzs001zw003zzzzk3zz000zz0000zz0000zs1zz080zzs0zs001zk003w0zz0Dy0A0z0000Dzzzk003zU003zzzzU7zs000zy0000zy0000zk3zy0E1zzk1zU001zU007s1zy0Tw001y0000TzzzU007y0003zzzz0DzU000zw0000zw0000zU7zw0U3zzU3z0001z000Dk3zw0zs003w0000Tzzz000Dw0003zzzy0Tz0000zs0000zs0000z07zk107zz07w0003y000TU7zs1zk007s0000zzzy000Tk0007zzzw0zw0001zk0000zk0000z0DzU60Dzw0Ds0S03w000z0Dzk3zU00Dk0000zzzw000z00007zzzs1zk0001zU0001zU0001y0Tz0A0Tzs0zU3z07z07zy0TzU7z000TU0z01zzzz07zy07w0Dzzzk3zU1z03z03y03z03y03w0zy0M0zzU1z0Dz07z0Dzw0zz0Dy003z07zU3zzzz0Dzw0Tw0TzzzU7z07z07y0Dy07y0Dy07s0zs0k1zy03w0Ty0Dy0Tzs1zy0Tw01zy0Dz07zzzy0Tzk1zw0Tzzz0Dw0Tz07w0Ty07w0Ty07s1zk3U0000Ds1zy0Tw0zzk3zw0zs0Tzw0Tz0Dzzzw0zzU3zs0zzzy0Ts0zy0Ds0zy0Ds0zy0Dk3zU700000Tk3zw0zs1zzU7zs1zk1zzs0zy0Tzzzs1zz07zk1zzzw0zk1zw0Tk1zw0Tk1zw0TU7z0C00001zU7zs1zk3zz0Dzk3zU3zzk1zw0zzzzk3zy0Tzk3zzzs1zU7zw0zU3zs0zU3zs0z07y0Q00007z0Dzk3zU7zy0TzU7z07zzU3zs0zzzzU7zw0zzU7zzzk3z0Dzs1z07zk1z07zk1z0Ds0s0000Ty00007z0Dzw0zz0Dy0Dzz07zk1zzzz0Dzs1zz0DzzzU7y0Tzk3y0Dzk3y0Dzk3y0Tk3k0001zw0000Dy0Tzs1zy0Tw0Tzy0DzU3zzzy0Tzk3zy0Dzzz0Dw0zzU3w0TzU7w0TzU7w0zU7U0003zs0000Tw0zzk3zw0zs0zzw0Tz07zzzw0zzU7zw0Tzzy0Ts1zz07s0zz0Ds0zz0Ds1z0D00007zk0000zs1zzU7zs1zk1zzs0zy0Dzzzs1zz0Dzs0zzzw0zk3zy0Dk1zy0Tk1zy0Ts1w0S0Dy0DzU0001zk3zz0Dzk3zU3zzk1zw0Tzzzk3zy0Tzk1zzzs1zU7zw0TU3zs0zU3zs0zk3s1w0Tw0Dz00003zU7zy0TzU7z07zzU3zs0zzzzU7zw0zzU7zzzk3z0Dzs1z07zk1z07zk1zU7k3s0zw0Ty0Tzzzz0Dzw0Tz0Dy0Dzz07zk1zzzz0Dzs1zz0DzzzU7y0Tzk3y0DzU3y0DzU3z0DU7k1zs0zw0zzzzy0Tzs0zy0Tw0Tzy0DzU3zzzy0Tzk1zw0Tzzz0Dw0Tz07w0Tz07w0Tz07z0C0DU3zs0zs0zzzzw0zzk1zw0zs0zzw0Tz07zzzw0zzU3zs0zzzy0Ts0zy0Ds0zy0Ds0zy0Dy0Q0z07zk1zk1zzzzs1zzU3zs1zk1zzs0zy0Dzzzs1zz07zk1zzzw0zk1zw0Tk1zs0Tk1zs0Tw0s1y0DzU1zU1zzzzk3zz03zk3zU3zzk1zw0Tzzzk3zz07z07zzzs1zk1zk1zU3zU1zU3zU1zs1k3w0TzU3zU1zzzzU3zz03w07z07zzU3zs0zzzzU3zy07w0Dzzzk3zU1z03z07y03z07y03zk107s0zz07z0000Dz003y0000Dy0Dzz07zk1zzzz003w0000TzzzU7z00007y00007y00007zk00Tk1zy07y0000Ty007w0000Tw0Tzy0DzU3zzzy007w0001zzzz0Dz0000Tw0000Tw0000TzU00zU3zy0Dy0000zw00Dw0000zs0zzw0Tz07zzzw00Dw0003zzzy0Tz0000zs0000zs0000zz001z07zw0Ty0001zw00Ts0001zk1zzs0zy0Dzzzw00Ts000Dzzzw0zy0003zk0003zk0003zy003y0Dzs0Ty0003zs00zs0003zU3zzk1zw0Tzzzs00zs000zzzzs1zy000DzU000DzU000Dzy00Dw0Tzs0zy0007zs01zs00U7z07zzU3zs0zzzzs01zw007zzzzk3zz001zz0000zz0000zzw00Ts0zzk0zz001zzw03zs0D0Dy0Dzz07zk1zzzzw03zy00zzzzzU7zzU0Dzy000Dzy000Dzzs00zzzzzzzzzs7zzzz1zzz3zzzzzzzzzzzzzzzzzz1zzzkTzzzzzzzzzw7zzzzUDzzzzUDzzzzk1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk3zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0zzU"
        if (FindText(&imgX,&imgY,1599,1660,2244,1801,0.1,0.1,returnImage)){
            return true
        }else{
            return false
        }
    }
    createLobbyAndPlay(){
        MouseMove hX,hY,0
        moveAndClick(coord,iterations?){
            dx:=coord.DebugClick[1]
            dy:=coord.DebugClick[2]
            x:=coord.Click[1]
            y:=coord.Click[2]
            MouseMove x,y,0
            MouseMove x+1,y,0
            Sleep 50
            MouseMove x,y,0
            MouseClick "Left"
            if (coord.HasOwnProp("Image") && !FindText(&imgX,&imgY,coord.Coords[1][1],coord.Coords[1][2],coord.Coords[2][1],coord.Coords[2][2],0,0,coord.Image)){
                ;MsgBox(dx,dy)
                MouseMove dx,dy,0
                MouseMove dx,dy+1,0
                Sleep 100
                iterationRoadblock(iterations)
                moveAndClick(coord,++iterations)
            }
        }
        for _, coord IN startCheck {
            moveAndClick(coord,1)
        }
    }
    waitUntilGameLoaded(){
        iterations:=0
        while (!detectIngame()){
            iterations+=0.5
            iterationRoadblock(iterations)
            SoundBeep(200,200)
            Sleep 500
        }
        SoundBeep(1500,200)
        Sleep 200
    }
    setCameraOrientation(){
        if WinExist("ahk_exe RobloxPlayerBeta.exe") {
            WinActivate("ahk_exe RobloxPlayerBeta.exe") ;bring to front screen
        }
        MouseMove hX,hY-1,0
        MouseMove hX,hY,0
        Sleep 300
        Click "Right","Down"
        Sleep 100
        MouseMove hX,hY+1000,0
        Sleep 100
        Click "Right","Up"
        Send "{O Down}"
        Sleep 2000
        Send "{O Up}"
    }
    setLoadout(){
        loadoutOrder:=[[1880, 1000],[1880, 1090],[1980, 1090],[1880, 1180],[1980, 1180]]
        placeFirstUnit(coord){
            x:=coord[1]
            y:=coord[2]
            MouseMove x,y,0
            MouseMove x+1,y,0
            Sleep 50
            MouseMove x,y,0
            MouseClick "Left"
            Sleep 100
            MouseMove 250,720,0
            MouseMove 249,720,0
            Sleep 50
            MouseMove 250,720,0
            MouseClick "Left"
        }
        placeLoadout(){
            MouseMove 1780,1000,0
            for _, coord IN loadoutOrder {
                placeFirstUnit(coord)
            }
            doubleCheckLoadout(1)
        }
        doubleCheckLoadout(iterations){
            failTrip:=false
            Sleep(1200)
            MouseMove 1780,1000,0
            for _, coord IN loadoutOrder {
                x:=coord[1]
                y:=coord[2]
                color:=("0x" SubStr(PixelGetColor(x,y,"Alt RGB"),7,2))+0
                if (color>240){
                    placeFirstUnit(coord)
                    failTrip:=true
                }
            }
            if (failTrip){
                iterationRoadblock(iterations)
                doubleCheckLoadout(++iterations)
            }
        }
        placeLoadout()
    }
    skipDialog(){
        MouseMove hX,1800,0
        MouseMove hX,1801,0
        Click "Left"
        Sleep 200
        Click "Left"
        Sleep 200
        Click "Left"
        Sleep 200
        Click "Left"
        Sleep 200
    } 
    beginGameAndSkip(){
        Send "{Tab}"
        Sleep(3000)
        skipDialog()
    }
    waitUntilTurnEnded(){
        iterations:=0
        while (!detectNextturn()){
            iterations+=0.5
            iterationRoadblock(iterations)
            SoundBeep(200,200)
            Sleep 500
        }
        SoundBeep(1500,200)
        Sleep 200
    }
    hoverHelos(){
        hoverOrder:=[[1880, 1000],[1880, 1090],[1980, 1090],[1880, 1180],[1980, 1180]]
        hoverUnit(coord){
            x:=coord[1]
            y:=coord[2]
            MouseMove x,y,0
            MouseMove x+1,y,0
            Sleep 50
            MouseMove x,y,0
            MouseClick "Left"
            Sleep 200
            Send "{1}"
            Sleep 200
            MouseClick "Left"
        }
        hoverLoop(iterations){
            MouseMove 1780,1000,0
            for _, coord IN hoverOrder {
                hoverUnit(coord)
            }
            MouseMove 1780,1000,0
            MouseMove 1780,1000+1,0
            Sleep 200
            MouseMove 1780,1000,0
            Sleep 1200
            hoverCheck(iterations)
        }
        hoverCheck(iterations){
            hoverImage:="|<>*128$12.U1U1U1UzVzUzU3U1U1zUzUzUzUX10101k7wTU"
            images:=FindText(&imgX,&imgY,1821,930,2008,1225,0.4,0.4,hoverImage)
            if images IS Integer||Type(images)=="Array"&&images.Length<5{
                iterationRoadblock(iterations)
                hoverLoop(++iterations)
            }
            Sleep 500
        }
        hoverLoop(1)
    }
    moveHelos(orderIndex){
        orders:=[
            [
                "|<>*128$12.U1U1U1UzVzUzU3U1U1zUzUzUzUX10101k7wTU",
                [1821, 930, 2008, 1225],
                {from:[1980, 1180],to:[1936, 1617]},
                {from:[1880, 1180],to:[1918, 1617]},
                {from:[1980, 1090],to:[1936, 1516]},
                {from:[1880, 1090],to:[1918, 1516]},
                {from:[1880, 1000],to:[1919, 1410]}
            ],
            [
                "|<>*130$20.zzzzw3zz0zzUDzk3zw0zy0Dz03zkkzs8Dw01z00Dk03w00zzUTzwDzz3zzkzzzzzzzzzzzzzzzzzy",
                [1370, 974, 1668, 1154],
                {from:[1423, 1023],to:[1109, 1064]},
                {from:[1415, 1120],to:[1103, 1155]},
                {from:[1521, 1024],to:[1206, 1067]},
                {from:[1519, 1126],to:[1198, 1153]},
                {from:[1623, 1025],to:[1298, 1064]}
            ],
            [
                "|<>*129$12.k3k3U1U0zUz0y1w3w3w1z0zUzkjU0001k7wTU",
                [942, 979, 1278, 1152],
                {from:[1028, 1027],to:[1149, 713]},
                {from:[1126, 1026],to:[1233, 712]},
                {from:[1223, 1022],to:[1326, 714]},
                {from:[1017, 1121],to:[1139, 798]},
                {from:[1119, 1119],to:[1228, 796]}
            ],
        ]
        moveUnit(i,coord,iterations){
            x:=coord.from[1]
            y:=coord.from[2]
            tx:=coord.to[1]
            ty:=coord.to[2]
            MouseMove x,y,0
            MouseMove x,y+1,0
            Sleep 50
            MouseMove x,y,0
            MouseClick "Left"
            Sleep 400
            MouseMove tx,ty,0
            MouseMove tx,ty+1,0
            Sleep 50
            MouseMove tx,ty,0
            MouseClick "Left"
            Sleep 300
            moveCheck(i,coord,iterations)
            Sleep 50
        }
        moveCheck(index,coord,iterations){
            moveImage:=orders[orderIndex][1]
            moveRange:=orders[orderIndex][2]
            images:=FindText(&imgX,&imgY,moveRange[1],moveRange[2],moveRange[3],moveRange[4],0.2,0.2,moveImage)
            if (Type(images)=="Array"&&images.Length>5-(index-2)){
                iterationRoadblock(iterations)
                moveUnit(index,coord,++iterations)
            }
        }
        moveLoop(){
            for i, coord IN orders[orderIndex] {
                if i!=1&&i!=2 {
                    moveUnit(i,coord,1)  
                }
            }
        }
        moveLoop()
    }
    skip(){
        Sleep 200
        Send "{Tab}"
        Sleep 1000
    }
    rotateMap(){
        Send "{Left Down}"
        sleep 740 ;755.079 precisely
        Send "{Left Up}"
        sleep 200
        microAdjustment(orientation,iterations){
            sleep 25
            MouseMove hX,hY,0
            sleep 10
            Click "Right","Down"
            sleep 10
            DllCall("mouse_event", "UInt", 0x01, "UInt", orientation, "UInt", 0)
            sleep 10
            Click "Right","Up"
            sleep 25
            checkRGB(orientation,iterations)
        }
        checkRGB(dir,iterations){
            RGBPass(ar,ag,ab){
                ;ToolTip((r>80) " " (g>80) " " (b>80) " " r " " g " " b)
                if (ar>72||ag>72||ab>92){ ;(r>65||g>65||b>65)&&(b-r>10)&&(b-g>30){
                    return true
                }else{
                    ;ToolTip(r " " g " " b)
                    return false
                }
            }
            split:=PixelGetColor(2704, 1688,"Slow RGB")
            R:=("0x" SubStr(split,3,2))+0
            G:=("0x" SubStr(split,5,2))+0
            B:=("0x" SubStr(split,7,2))+0
            ;MsgBox(R " " G " " B " | " SubStr(split,3,4))
            if RGBPass(R,G,B){
                ;Left
                lsplit:=PixelGetColor(2688, 1710,"Slow RGB")
                lR:=("0x" SubStr(lsplit,3,2))+0
                lG:=("0x" SubStr(lsplit,5,2))+0
                lB:=("0x" SubStr(lsplit,7,2))+0
                flsplit:=PixelGetColor(2596, 1820,"Slow RGB")
                flR:=("0x" SubStr(flsplit,3,2))+0
                flG:=("0x" SubStr(flsplit,5,2))+0
                flB:=("0x" SubStr(flsplit,7,2))+0
                ;Right
                rsplit:=PixelGetColor(2726, 1647,"Slow RGB")
                rR:=("0x" SubStr(rsplit,3,2))+0
                rG:=("0x" SubStr(rsplit,5,2))+0
                rB:=("0x" SubStr(rsplit,7,2))+0
                frsplit:=PixelGetColor(2771, 1546,"Slow RGB")
                frR:=("0x" SubStr(frsplit,3,2))+0
                frG:=("0x" SubStr(frsplit,5,2))+0
                frB:=("0x" SubStr(frsplit,7,2))+0
                Click "Right","Up"
                iterationRoadblock(iterations)
                iterations+=1/10
                ;ToolTip R " " G " " B " | " dir
                ToolTip dir ":" flR "|" flG "|" flB " " lR "|" lG "|" lB " " R "|" G "|" B " " rR "|" rG "|" rB " | " frR "|" frG "|" frB
                if (!RGBPass(lR,lG,lB)){
                    ;ToolTip lR " " lG " " lB " | 3"
                    microAdjustment(2,iterations)
                    return
                }
                if (!RGBPass(flR,flG,flB)){
                    ;ToolTip flR " " flG " " flB " | 6"
                    microAdjustment(6,iterations)
                    return
                }
                if (!RGBPass(rR,rG,rB)){
                    ;ToolTip rR " " rG " " rB " | -3"
                    microAdjustment(-2,iterations)
                    return
                }
                if (!RGBPass(frR,frG,frB)){
                    ;ToolTip frR " " frG " " frB " | -6"
                    microAdjustment(-6,iterations)
                    return
                }
                microAdjustment(dir,iterations)
            }
        }
        checkRGB(-7,1)
    }
    attackHelos(){
        attackTarget:=[1140, 545]
        attackCoords:=[
            [1073, 659],
            [1167, 649],
            [1262, 645],
            [1064, 737],
            [1161, 748],
        ]
        attackUnit(coord){
            x:=coord[1]
            y:=coord[2]
            tx:=attackTarget[1]
            ty:=attackTarget[2]
            MouseMove x,y,0
            MouseMove x+1,y,0
            Sleep 50
            MouseMove x,y,0
            MouseClick "Left"
            Sleep 200
            Send "{2}"
            Sleep 200
            MouseMove tx,ty,0
            MouseMove tx+1,ty,0
            Sleep 50
            MouseMove tx,ty,0
            MouseClick "Left"
            Sleep 200
        }
        attackLoop(iterations){
            for _, coord IN attackCoords {
                attackUnit(coord)
            }
            Sleep 4000
            attackConfirm(1)
        }
        attackConfirm(iterations){
            attackImage:="|<>*139$44.zzzzw1zzzzzz0TzzzzzU7zzzzzk1zzzzzw0Tzzzzy07zzzzz01zzzzzk0Tzzzzs07zzzzy01zzzzz00TzzzzU07zzzzs01zzzzw20Tzzzy0U7zzzzUM1zzzzk60Tzzzs3U7zzzy1s1zzzz0S0TzzzUDU7zzzs7s1zzzw1y0Tzzy0zU7zzzUTs1zzzk7y0Tzzs3zU7zzy0zs1zzz0Ty0TzzkDzU7zzs3zs1zzw1zy0Tzz0zzU7zzUDzs1zzk7zy0Tzw3zzU7zy0zzs1zz0Tzy0Tzk7zzU7zs3zzs1zw1zzy0Tz0TzzU7zUDzzs1zk0000000000000000000000000000000000000000000Dzzzy0TzzzzzU7zzzzzs1zzzzzy0TzzzzzU7zzzzzs1zzzzzy0TzzzzzU7zzzzzs1zzzzzy0TzzzzzU7zzzzzs1zzzzzy0TzzzzzU7zzzzzs1zzzzzy0TzzzzzU7zzzzzs1zs"
            images:=FindText(&imgX,&imgY,1994,371,2066,457,0.1,0.1,attackImage)
            if images IS Integer{
                iterationRoadblock(iterations)
                attackLoop(++iterations)
            }
        }
        attackLoop(1)
    }
    waitUntilReturn(){
        iterations:=0
        while (!detectReturn()){
            iterations+=0.5
            iterationRoadblock(iterations)
            SoundBeep(200,200)
            Sleep 500
        }
        SoundBeep(1500,200)
        Sleep 200
        x:=1926
        y:=1734
        MouseMove x,y,0
        MouseMove x+1,y,0
        Sleep 50
        MouseMove x,y,0
        MouseClick "Left"
        sessionData.success++
        statisticUpdate()
    }
    waitUntilLobby(){
        iterations:=0
        while (!detectLobby()){
            iterations+=0.5
            iterationRoadblock(iterations)
            SoundBeep(200,200)
            Sleep 500
        }
        SoundBeep(1500,200)
        Sleep 200
    }
    termination(){
        waitUntilLobby()
        SetTimer Tick, 0
        running:=false
        endTime:=A_TickCount
        sessionData.times.Push(endTime-startTime)
        statisticUpdate()
        if (terminate){
            terminate:=false
            SoundBeep(600,200)
            return
        }
        sleep 200
        execute()
    }
    ;MsgBox(detectLobby() detectIngame())
    if (detectLobby()&&!detectIngame()){
        CreateLobbyAndPlay()
        waitUntilGameLoaded()
    }
    setCameraOrientation()
    setLoadout()
    beginGameAndSkip()
    waitUntilTurnEnded()
    hoverHelos()
    moveHelos(1)
    skip()
    rotateMap()
    ;sleep 2000000
    waitUntilTurnEnded()
    moveHelos(2)
    skip()
    waitUntilTurnEnded()
    moveHelos(3)
    skip()
    waitUntilTurnEnded()
    attackHelos()
    waitUntilReturn()
    termination()
}
statisticUpdate(){
    if sessionData.success!=0&&sessionData.failure!=0{
        successRate:=Round((1-(sessionData.failure/(sessionData.success+sessionData.failure)))*100,2)
    }else{
        if sessionData.failure==0&&sessionData.success>0{
            successRate:=100
        }else{
            successRate:=0
        }
    }
    iterant:=0
    averageTime:=0
    for _, time IN sessionData.times{
        iterant++
        averageTime+=time
    }
    if iterant==0{
        iterant++
    }
    averageTime/=iterant*1000
    averageTime:=Round(averageTime,2)
    MyGui.Destroy()
    rollNewGui()
    ;MsgBox "Success rate: " successRate "%`nSuccessful Trials: " sessionData.success "`nFailed Trials: " sessionData.failure "`nAverage Time: " averageTime " s"
    MyGui.AddText("c00ff00","Success: " sessionData.success)
    MyGui.AddText("cRed","Failures: " sessionData.failure)
    MyGui.AddText("c787878","Success Rate: " successRate "%")
    MyGui.AddText("c787878","Average Time: " averageTime " s")
    if WinExist("ahk_exe RobloxPlayerBeta.exe") {
        WinActivate("ahk_exe RobloxPlayerBeta.exe") ;bring to front screen
    }
}
exitFunc(reason,code){
    SoundBeep(500,200)
}
OnExit exitFunc
guiVisibility:=true
MyGui:=Gui()
rollNewGui(){
    global MyGui:=Gui()
    MyGui.Opt("+E0x20 +AlwaysOnTop +LastFound -Caption +ToolWindow") 
    MyGui.BackColor:="101010"
    WinSetTransparent("200",MyGui.Hwnd)
    MyGui.SetFont("s18")
    MyGui.Show()
    MyGui.Move(0, 150,380,220)
    if !guiVisibility{
        MyGui.Hide()
    }
}
statisticUpdate()
toggleGui(){
    global guiVisibility
    if (guiVisibility){
        guiVisibility:=false
        MyGui.Hide()
    }else{
        guiVisibility:=true
        MyGui.Show() 
    }
}
;MsgBox "PLEASE CHANGE DAYLIGHT AND SCREEN SHAKE SETTINGS FOR OPTIMAL PERFORMANCE! Ensure that ATGM helicopter is the only ground unit in loadout, and play in fullscreen`nF8 to execute, F7 to pause/unpause, F2 to terminate after completion, F6 to close program, F5 reopen app (debugging), F1 to show/hide statistics`n`n(Note: This automation uses color detection, and is highly dependent on a 3840 x 2160 resolution desktop.)"
F1::toggleGui()
F2::terminate:=true
F8::execute()
F7::Pause(-1)
F6::ExitApp()
F5::Reload()