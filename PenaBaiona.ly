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

% --- Notes du Tuba en Fa Majeur (Style Banda / Registre Corrigé) ---
tubaNotes = \relative f, {
  \clef bass
  \key f \major
  \time 2/4
  \tempo 4 = 90
  \override Script.padding = #2
  
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
    bes4 r f r | bes r f r | f r c' r | f, r c' r |
    c4 r g r | c r g r | f r c' r | f,4 r f r | \break
    
    bes4 r f r | bes r f r | f r c' r | f, r c' r |
    c4 r g r | c r g r |
  }
  \alternative {
    { \volta 1 { f4 r f r } }
    { \volta 2 { f4 c f r } }   % Accord final
  }
  
  \bar "|."
}


sautsDeLigne = {
  \repeat unfold 11 { s1*5 \break }
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
