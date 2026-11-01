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

BreakUn = {

 % Mesure 17
  e'8. a'8. e''4 a'8 e'4 |

  % Mesure 18
  fis'8. b'8. fis''4 b'8 f'4 |

  % Mesure 19
  a'8. e''8. dis''8 d''8. c''8. g'8 |         % Mesure A

}

Introduction = {

% Mesure 1 : 9 notes au total, 4 groupes distincts (queues en bas)
  \stemDown
  e'16\f^"Intro"[ e'8-. e'16]    e'8-.[ e'16 e'16-.~]    e'16[ e'16 e'8-.]    g'8[ gis'8] |
  \stemNeutral
  
  % Mesure 2 (Pause)
  R1 |

  % Mesures 3 et 4
  \ThemeNuance

  % Mesures 5 à 8
   \repeat unfold 2 {
    \Theme
  }
}

ThemeUn = {

 % Mesures 9 à 12 : Répétition de la tourne principale (2 fois = 4 mesures)

  \bar "||" ^"Thème 1"
  \repeat unfold 2 {\Theme}
  
  % Mesures 13 et 14 (La variante aiguë)
  \repeat unfold 2 {
    d''8. a''8. gis''8 g''8. f''8. c''8 |
  }

 % Mesures 15 à 16 : Répétition de la tourne principale
  \Theme

 % Mesures 17 et 18 : Break
  \BreakUn
}

saxMusic = {
  \clef treble
  \time 4/4
  \key c \major
  \tempo 4 = 141
  
  \Introduction % 8 mesures
  
  \ThemeUn % 

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
