\version "2.24.0"

\header {
  title = "Tank!"
  subtitle = "Cowboy Bebop"
  composer = "Yoko Kanno (The Seatbelts)"
  arranger = "Ewenique"
  instrument = "Saxophone Baryton"
}

ThemeNuance = {

  a'8.\mf e''8. dis''8 d''8. c''8. g'8 |      % Mesure A
  a'8. e''8. dis''8 d''8. c''8 c''16 g'8 |    % Mesure B

}

Theme = {

  a'8. e''8. dis''8 d''8. c''8. g'8 |         % Mesure A
  a'8. e''8. dis''8 d''8. c''8 c''16 g'8 |    % Mesure B

}

ThemeAigu = { % Variante Aigüe

  d''8. a''8. gis''8 g''8. f''8. c''8 |

}

Introduction = {

% Mesure 1 : 9 notes au total, 4 groupes distincts (queues en bas)
  \stemDown
  e'16\f^"Intro"[ e'8-. e'16]    e'8-.[ e'16 e'16-.~]    e'16[ e'16 e'8-.]    g'8[ gis'8] |
  \stemNeutral
  
  % Mesure 2 (Pause)
  R1 |

  \mark \markup { \box "A" }
  % Mesures 3 et 4
  \ThemeNuance

  % Mesures 5 à 8
   \repeat unfold 2 {
    \Theme
  }
}

ThemeUn = {

 % Mesures 9 à 12 : Répétition de la tourne principale (2 fois = 4 mesures)

  \bar "||" ^"   Thème 1"
  \mark \markup { \box "B" }
  \repeat unfold 2 {\Theme}
  
  % Mesures 13 et 14 (La variante aiguë)
  \ThemeAigu
  }

 % Mesures 15 à 16 : Répétition de la tourne principale
  \Theme
}

PontUn = {

\bar "||" ^"Pont 1"

 % Mesure 17
  e'8. a'8. e''4 a'8 e'4 |

  % Mesure 18
  fis'8. b'8. fis''4 b'8 f'4 |

  % Mesure 19
  a'8. e''8. dis''8 d''8. c''8. g'8 |         % Mesure A

   % Mesure 20
   r2 r4 r8 a'8~ |

  \mark \markup { \box "C" }

   % Mesure 21
   a'1 |

   % MEsure 22
   gis'1 |

   % Mesure 23 et 24 
   \repeat unfold 2 {a'8 r16 a'16~a'4 a'8 r16 a'16~a'4}

  % Mesure 25
  fis'1 |

  % Mesure 26
  f'1 |

 % Mesure 27
 fis'8 r16 fis'16~fis'4 f'8 r16 f'16~f'4 |

 % Mesure 28
  e'1 |

}

ThemeDeux = {

  \bar "||" ^"   Thème 2"
  \mark \markup { \box "D" }
  % Mesure 29 et 30
  \repeat unfold 2 {\Theme}

}

saxMusic = {
  \clef treble
  \time 4/4
  \key c \major
  \tempo 4 = 141
  
  \Introduction % 01 à 08
  
  \ThemeUn % 09 à 16

  \PontUn % 17 à 28

  \ThemeDeux % 29 à

}

sautsDeLigne = {
  \repeat unfold 10 { s1*4 \break }
}

\score {
  \new Staff {
    <<
      \saxMusic
      \sautsDeLigne
    >>
  }
  \layout {
    \context {
      \Score
      \override NonMusicalPaperColumn.line-break-permission = ##f
    }
  }
}
