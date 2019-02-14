\version "2.18.2"

\header {
  title = "Winter is Icumen in"
  subtitle = "A Song of Evening"
  composer = "Ezra Pound"
}

melody = {
  \time 6/8
  c4^\markup{\circle \number 1} b8 a4 b8 | c4 c8 b8([ a g)] | e4^\markup{\circle \number 2} e8 f4 d8 | e4. r4. | \break
  c4^\markup{\circle \number 3} e8 d4 f8 | e4 e8 d4 c8 | e4^\markup{\circle \number 4} g8 a4 a8 | g4. r4. | \break
  c4. a4. | c4. r4. | g4 e8 f4 d8 | e4 g8 f4 e8 |
  c4 e8 d4 b8 c4. r4. | e4 e8 d4 f8 | g4 g8 a4 b8 |
  c4 b8 a4 b8 | c4. r4. | g4. a4. | g4. f4. |
  c4 e8 f4 d8 | e4 f4. a8 | e4 g8 d4 b8 | c2.  \bar ":|." \break


  %Pushes down Accompaniment
  
   \overrideProperty Score.NonMusicalPaperColumn.line-break-system-details #'((Y-offset . 80))
   
   \time 6/8
	 c4.^\markup{ 
                \column { 
                    \line { \center-align Accompaniment } 
                    \null
                    \line { \circle \number 1 } 
          
	         } 
	 }
    d4. | c4. d4([ e8)] | g4.^\markup{\circle \number 2} f4. g4. r4. \bar ":|."
  
}

words = \lyricmode {
Win -- ter is i -- cu -- men in,
Lhu -- de sing God -- damm,
Rain -- eth drop and stain -- eth slop,
And how the wind doth ramm!
Sing: God -- damm.

Skid -- deth bus and slop -- peth us,
An a -- gue hath my ham.
Freez -- eth ri -- ver, turn -- eth li -- ver,
Damm you; Sing: God -- damm.

God -- damm, God -- damm, 'tis why I am, God -- damm,
So 'gainst the win -- ter's balm.


Sing god -- damm, damm, sing god -- damm,
}

\score {
  <<
    #(if (ly:get-option 'modern) #{
      \new Voice = "one" {
        \relative c'' { \melody }
      }
    #} #{
      \new VaticanaVoice = "one" {
        \relative c' { \melody }
      }
    #} )
      
    \new Lyrics \lyricsto "one" {
      \words
    }
  >>
  \layout {}
  \midi {}
}