maincss = new CSSC


theme =
  primary: CSSC.white
  secondary: CSSC.yellow
  bgPrimary: (new CSSC.Clr [CSSC.black, 0.5]).rgba()
  bgSecondary: (new CSSC.Clr [CSSC.black, 0.1]).rgba()


console.log 'Theme', theme


maincss
  .add '.green-bg', background: CSSC.green
  .add '.red-bg', backgroundColor: CSSC.red
  .add '.footer-bg', backgroundColor: theme.bgSecondary
  .add '.menuPadding', width: CSSC.pc 100
  .add 'body',
    background: theme.bgPrimary
    color: theme.primary

Tracker.autorun ->
  width = rwindow.innerWidth()
  switch
    when width < 640
      Session.set 'menuHeight', 50
      maincss
        .add 'html', fontSize: CSSC.px 14
        .add '.menuPadding', height: CSSC.px 50
    else
      Session.set 'menuHeight', 100
      maincss
        .add 'html', fontSize: CSSC.px 20
        .add '.menuPadding', height: CSSC.px 100
