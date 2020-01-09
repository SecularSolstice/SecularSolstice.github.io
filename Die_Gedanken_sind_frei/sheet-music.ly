\version "2.18.2"

\header {
  title = "Die Gedanken Sind Frei/"
  subtitle = "A Song of Twilight"
}

melody = \relative c'' {
  \key c \major \time 3/4 \partial 4 \autoBeamOff
  g8 g | c4 c e8([ c]) | g2 g4 | f d g | e c
  g' | c c e8([ c]) | g2 g4 | f d g | e c
  c' | b d d | c e e | b d d | c e
  c | a a c8([ a]) | g2 g8 e' | e([ d]) c4 b | c2 \bar "|."
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
  und | den -- ken da -- |bei: Die Ge -- | dan -- ken sind | frei!
}
  
verse_e = \lyricmode {
  _ Ich | lie -- be den | Wein, mein | Mäd -- chen vor |  al -- len,
  sie | tut mir all -- | ein am | best -- en ge -- | fall -- en.
  Ich | sitz nicht all -- | ein -- e bei | mein -- em Glas | Wein -- e,
  mein | Mäd -- chen da -- | bei: Die Ge -- | dan -- ken sind | frei!
}


\score {
  <<
    \new Voice = "voice" {
      \melody
    }
    \new Lyrics \lyricsto "voice" {
      <<
        \new Lyrics \verse_a
        \new Lyrics \verse_b
        \new Lyrics \verse_c
        \new Lyrics \verse_d
        \new Lyrics \verse_e
      >>
    }
  >>
}