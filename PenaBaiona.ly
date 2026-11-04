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
  \time 4/4
  \tempo 4 = 90
  
  % --- INTRODUCTION (4 mesures typiques) ---
  f4 r c' r | f, r c' r | 
  f,4 r c' r | f, g a bes | \break
  
  % --- COUPLET ---
  \repeat volta 2 {
    f4 r c' r | f, r c' r | f, r c' r | c r g r |
    c4 r g r | c r g r | c r g r | f r c' r | \break
    
    f,4 r c' r | f, r c' r | f, r f r | bes r f r |
    bes4 r f r | f r c' r | c r g r |
  }
  \alternative {
    { \volta 1 { f4 g a bes } } % Relance couplet
    { \volta 2 { f4 r f r } }   % Transition vers refrain
  } \break
  
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

% --- Structure de la partition ---
\score {
  \new Staff {
    \context Voice = "tuba" { \tubaNotes }
  }
  \layout { }
  \midi { }
}
