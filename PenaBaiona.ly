\version "2.24.0"

\header {
  title = "La Peña Baiona"
  subtitle = "Hymne de l'Aviron Bayonnais"
  composer = "Udo Jürgens (Vino Griego)"
  poet = "Dominique HERLAX"
  arranger = "Arr. J. LEMAÎTRE"
  instrument = "Tuba"
  tagline = ##f
}

leTheme =  { \relative c' {
  
    d4 d8. e16 | f2~ | f8 f f e | g f e d | a4 a8. bes16 | c2~ | c8 c c b | d c bes a | \break
    
  }
  
}

% --- Notes du Tuba en Fa Majeur (Style Banda / Registre Corrigé) ---
tubaNotes = \relative f, {
  \clef bass
  \key f \major
  \time 2/4
  \tempo 4 = 90
  \override Script.padding = #1

  % --- INTRODUCTION (4 mesures typiques) ---
  r4 a\f \fermata | d\fermata f\fermata | \bar "||" \break
   f4-. c-. | f-. c-. | f-. c-. | f-. c-. | 
  d-. a-. | d-. a-. | d-. d8-. des-. | \break
  
  % --- COUPLET ---
  \repeat volta 2 {
    d4-. a-. | d-. a-. | d-. a-. | d-. a-. |d-. a-. |
    d-. d8-. e-. | f4-. c-. | f-. c-. | g'-. c,-. |\break
    
    g'-. c,-. | d-. f-. | e-. a,-. | d-. a-. | d-. a-. |
  }
  \alternative {
    { \volta 1 { d-. a-. | d8 a d des } } % Relance couplet
    { \volta 2 { d4-. a } }   % Transition vers refrain
  } \textMark "    To Coda" d-. r | \break
  
  % --- REFRAIN ---
  \repeat volta 2 {
    bes f' | bes, f' | bes, f' | bes, f' |
    f c | f c | f c | f c | \break
    
    g' c, | g' c, | g' c, |
  }
  \alternative {
    { \volta 1 { g' c, | f c | f8 c d e | f4 c | f8 f g a | } \break }
    { \volta 2 { g4 c, | } } } 
    
   d a | d a | d a | d a | d a \textMark "D.C. al Coda"| d \fermata r \fermata \bar "||" \break
  
  \textMark \markup \scale #'(1.85 . 1.15) \coda
  bes f' | bes, f' | bes, f' | bes, f' | f c | f c | f c | f c | \pageBreak
  g' c, | g' c, | g' c, | g' c, | f c | f8 c d e | f4 c | f8 f g a |  \break
  \textMark "Thème"
  \leTheme
   \transpose  d g {d4 d8. e16 | f2~ | f8 f f e | g f e d | }
    a2~ | a8 bes c d | c8 c c b | d c bes a | \break
    
     % Accord final
  
  \bar "|."
}


sautsDeLigne = {
  %\repeat unfold 11 { s1*5 \break }
}

% --- Structure de la partition ---
\score {
  \new Staff {
    \context Voice = "tuba" { \tubaNotes }
    \sautsDeLigne
  }
  \layout { }
  \midi { }
}
