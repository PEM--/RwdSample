maincss = new CSSC

theme =
  primary: CSSC.white
  secondary: CSSC.yellow
  bgPrimary: (new CSSC.Clr [CSSC.black, 0.6]).rgba()
  bgSecondary: (new CSSC.Clr [CSSC.black, 0.95]).rgba()

maincss
  .add '.green-bg', background: theme.bgPrimary
  .add '.red-bg', backgroundColor: theme.bgPrimary
  .add '.footer-bg', backgroundColor: theme.bgSecondary
  .add '.menuPadding', width: CSSC.pc 100
  .add 'html.famous-root',
    color: theme.primary
    background: 'url(/background.jpg) no-repeat center center fixed'
    backgroundColor: theme.bgPrimary
    backgroundSize: 'cover'

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