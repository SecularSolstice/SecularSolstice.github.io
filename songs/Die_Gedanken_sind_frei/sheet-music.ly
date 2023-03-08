\version "2.18.2"

\header {
  title = "Die Gedanken Sind Frei"
  subtitle = "A Traditional Song of Freedom"
  composer = "Hoffmann von Fallersleben et. al."
  arranger = #(if (ly:get-option 'english) "Translated by Daniel Speyer" "")
}

melody = \relative c'' {
  \key c \major \time 3/4 \partial 4 \autoBeamOff
  g8 g | c4 c e8([ c]) | g2 g4 | f d g | e c
  g' | c c e8([ c]) | g2 g4 | f d g | e c
  c' | b d d | c e e | b d d | c e
  c | a a c8([ a]) | g2 g8 e' | e([ d]) c4 b | c2 \bar "|." \break
  c4 | a a c8([ a]) | g2 g8 e' | e([ d]) c4 b | c2 
}

harmony = \relative c'' {
  \chordmode {
   g4 s1. d2.:1.3.5.7 g
   g s d:1.3.5.7 g d
   g d2.:1.3.5.7 g c
   g d2.:1.3.5.7 g
  }
}
  
verse_a = \lyricmode {
  Die Ge -- | dan -- ken sind | frei, wer | kann sie er -- | ra -- then?
  Sie | flie -- gen vor -- | bei wie | nächt -- li -- che | Schat -- ten.
  Kein | Mensch kann sie | wis -- sen, kein | Jä -- ger sie | schie -- ßen.
  Es | blei -- bet da -- | bei: Die Ge -- | dan -- ken sind | frei.
}

verse_b = \lyricmode {
  Ich den -- | ke was ich |  will und | was mich be -- | glüc -- ket,
  doch | al -- les inder | Still',  und |  wie es  sich | schick -- et.
  Mein | Wunsch und  Be -- | geh -- ren kann | niem --  and  ver -- | weh -- ren, 
  es | blei --  bet  da -- | bei: Die Ge -- | dan -- ken sind | frei
}

verse_c = \lyricmode {
  Und sperrt |  man _ mich | ein im | fin -- ster -- en | Ker -- ker,
  das | al -- les sind | rein  ver -- | ge --  blich -- e | Werk -- e.
  Denn | mein -- e Ge -- | dan -- ken zer -- | rei -- ßen die | Schrank -- en
  und |  Mau -- ern ent -- | zwei: Die Ge -- | dan -- ken sind | frei!
}

verse_d = \lyricmode {
  _ Drum | will ich auf | im -- merden |  Sor -- gen ent -- | sa -- gen
  und | will mich auch | nim -- mermit | Grill -- en  mehr | pla --  gen.
  Man | kann ja im | Her -- zen stets | lach -- en und | scher -- zen
  und | den -- ken da -- | bei: Die Ge -- | dan -- ken sind | frei!
}
  
verse_e = \lyricmode {
  _ Ich | lie -- be den | Wein, mein | Mäd -- chen vor |  al -- len,
  sie | tut mir all -- | ein am | best -- en ge -- | fall -- en.
  Ich | sitz nicht all -- | ein -- e bei | mein -- em Glas | Wein -- e,
  mein | Mäd -- chen da -- | bei: Die Ge -- | dan -- ken sind | frei!
}

% lyricnote: English Version

english_a = \lyricmode {
  Oh my think -- ing is free.  No one can it har -- ness. 
  My log -- ic soars high, like ow -- ls in dark -- ness.
  No spy can dis -- play it; no hunt -- er can slay it;
  With Glock nor U -- zi.  For my think -- ing is free!
  
}

english_b = \lyricmode {
  Yes I think as I choose and by my de -- si -- re.
  The world may grow still; my int' -- rest seeks high -- er.
  My val -- ues im -- pli -- cit: no one can in -- hi -- bit.
  As al -- ways it'll be.  For my think -- ing is free!
}

english_c = \lyricmode {
  Ev -- en if I am cast in -- to deep -- est dung -- eon.
  It gives them no aid; no game have they won then.
  If ram -- part and tow -- er face think -- ing's own pow -- er,
  They'll soon cease to be.  Still my think -- ing is free!
}

english_d = \lyricmode {
  So I bid a fare -- well to sor -- row for -- ev -- er.
  So pet -- ty mise -- ry will trou -- ble me nev -- er.
  Odd word -- play and deep truths, ro -- man -- ces and neat proofs.
  Stay al -- ways in me.  For my think -- ing is free!
  Stay al -- ways in me.  For my think -- ing is free!
}
  
  
\score {
  <<
    \new ChordNames = "harmony" {
      \harmony
    }
    \new Voice = "voice" {
      \melody
    }
    \new Lyrics \lyricsto "voice" {
      #(if (ly:get-option 'english) #{
        <<
          \new Lyrics \english_a
          \new Lyrics \english_b
          \new Lyrics \english_c
          \new Lyrics \english_d
        >>
      #} #{
        <<
          \new Lyrics \verse_a
          \new Lyrics \verse_b
          \new Lyrics \verse_c
          \new Lyrics \verse_d
          \new Lyrics \verse_e
        >>
      #} )          
    }
  >>
}