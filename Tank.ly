\version "2.24.0"

% Réduire / Augmenter la taille de toute la partition, Défaut 20
#(set-global-staff-size 18)

\header {
  title = "Tank!"
  subtitle = "Cowboy Bebop"
  composer = "Yoko Kanno (The Seatbelts)"
  arranger = "Ewenique"
  instrument = "Saxophone Baryton"
}

\paper {
  % 1. Autorise LilyPond à étirer l'espace entre toutes les portées
  ragged-bottom = ##f
  ragged-last-bottom = ##f
  
  % 2. Ajuste la souplesse de l'espacement vertical (système à système)
  system-system-spacing = #'(
    (basic-distance . 12)
    (minimum-distance . 8)
    (padding . 2)
    (stretchability . 40) % Plus ce chiffre est élevé, plus LilyPond étirera l'espace
  )
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
 d''8. a''8. gis''8 g''8. f''8 f''16 c''8 |

}

Introduction = { % 01 à 08

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

ThemeUn = { % 09 à 16

 % Mesures 9 à 12 : Répétition de la tourne principale (2 fois = 4 mesures)

  \mark \markup { \box "B" }
  \bar "||" ^"   Thème 1"
  \repeat unfold 2 {\Theme}
  
  % Mesures 13 et 14 (La variante aiguë)
  \ThemeAigu

 % Mesures 15 à 16 : Répétition de la tourne principale
  \Theme
}

PontUn = { % 17 à 28

 % Mesure 17
  e'8.\f a'8. e''4 a'8 e'4 |

  % Mesure 18
  fis'8. b'8. fis''4 b'8 fis'4 |

  % Mesure 19
  a'8. e''8. dis''8 d''8. c''8. g'8 | 
  
  % Mesure 20
  r2 r4 r8 a'8~\mf |

  \bar "||"

  % Mesure 21
  \mark \markup { \box "C" }
  a'1 |

  % Mesure 22
  gis'1 |

  % Mesure 23 et 24
  \repeat unfold 2 { a'8 r16 a'16~a'4 a'8 r16 a'16~a'4 | }
  
  % Mesure 25
  fis'1 |

  % Mesure 26
  f'1 |

  % Mesure 27
  fis'8\f r16 fis'16~fis'4 f'8 r16 f'16~f'4 | 

  % Mesure 28
  e'1 |

}

ThemeDeux = { % 29 à 36

 % Mesure 29 30
 \mark \markup { \box "D" }
 \bar "||" ^"   Thème 2"
 \ThemeNuance

 % Mesure 31 32
 \Theme

 % Mesure 33 34
 \ThemeAigu

 % Mesure 35 36
 \Theme
}

PontDeux = { % 37

 % Mesure 37
  e'8.\f a'8. e''4 a'8 e'4 |

  % Mesure 38
  fis'8. b'8. fis''4 b'8 fis'4 |

  % Mesure 39
  gis'8. cis''8. gis''4 cis''8 gis'4 |
  
  % Mesure 40
  r8 b'16 ais'16 r4 cis''16 c''16 r8 r4
  % r2 r4 r8 a'8~\mf |

  \bar "||"^"   Final"

  % Mesure 41
  \mark \markup { \box "E" }
  e'8. a'8. e''8~e''2~ |
  
  % Mesure 42
  e''16 f''16 e''16 b'16 a'8 f'8 e'2

  % Mesure 43
  e'8. a'8. e''8~e''4 e''4 |

  % Mesure 44
  \repeat unfold 8 {e''16} e''4 e''4

  % Mesure 45
  a'8. aes'8. g'8~g'8. ges'8. f'8~ |

  % Mesure 46
  f'8. e'8. ees'8~ ees'8. d'8. des'8 |

  % Mesure 47
  a'8 r8 r4 r2 |

  % Mesure 48
  r2 r4 c''16 f'16 r8

  % Mesure 49
  r4 r16 a'8.~ a'2~ |

  % Mesure 50 51
  a'1~| a'1~|

  % Mesure 52, Génère un quart de cercle vers le bas 
  a'2.-\bendAfter #-10  

}

saxMusic = {
  \clef treble
  \time 4/4
  \key c \major
  \tempo 4 = 141
  
  \Introduction % 01 à 08
  
  \ThemeUn % 09 à 16

  \PontUn % 17 à 28

  \ThemeDeux

  \PontDeux
}

sautsDeLigne = {
  \repeat unfold 11 { s1*5 \break }
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
