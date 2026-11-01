\header {
  title = "Gammes"
  composer = "Sans"
}

gammeMajeure = { 
    c4 d8 e f g a b | c'4 b8 a g f e d | c e g e c e g e | c f a f c f a f | \break
    c e g e c e g e | c f a f c f a f | c c' b8 a g f e d | c d c e c f c g | \break
    c b c c' c' b c' a | c' g c' f c' e c' d | c' c~c2. | r1 \bar "|." \break
    
  }

\score {
  \relative c {
    \clef "bass"
    \key bes \major
    \transpose c' bes \gammeMajeure
    \bar "|."
  }

  \layout {}
  \midi {}
}