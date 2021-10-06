{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Data.Semigroup (stimes)
import System.Process (runCommand)
import Text.Printf (printf)
import Data.WAVE (putWAVEFile, WAVE(WAVE), WAVEHeader(WAVEHeader))
import Parsers
import Types
import Instruments

main :: IO ()
main = do putStrLn "Deze versie van de code bevat nog niet de testsuite zoals jullie gewend zijn."
          putStrLn "Deze wordt zo snel mogelijk gepushed naar de Git (git merge upstream/main)."
          putStrLn "Echter, als je code al klopt, kan hij al wel een ringtone genereren!"
          putStrLn "Als het niet automatisch speelt, staat het bestand in de map van het project,"
          putStrLn "met de naam axelf.wav."
          putStrLn "Druk op Enter om het te proberen (kan tot errors leiden)!"
          _ <- getLine
          putStrLn "Succes met het practicum, en moge je maar snel deze pestherrie horen!"
          playRTTL defaultInstrument axelf

sandstorm' :: [Track]
sandstorm' = [(defaultInstrument, [Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Eighth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Eighth, Note E Four Sixteenth, Note E Four Sixteenth, Note E Four Sixteenth, Note E Four Sixteenth, Note E Four Sixteenth, Note E Four Sixteenth, Note E Four Eighth, Note D Four Sixteenth, Note D Four Sixteenth, Note D Four Sixteenth, Note D Four Sixteenth, Note D Four Sixteenth, Note D Four Sixteenth, Note D Four Eighth, Note A Three Eighth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Quarter, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Eighth, Note E Four Eighth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Quarter, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Sixteenth, Note B Three Quarter])]

zombie' :: [Track]
zombie' = [(noise, zSnare), (kick, zKick), (kick, zKick), (kick, zKick), (twisted, zNotes)]
  where zKick = stimes (7 :: Int) [Note B One Eighth, Pause Eighth] <> [Pause Half] <> stimes (5 :: Int) [Note B One Eighth, Pause Eighth]
        zSnare = stimes (7 :: Int) [Pause Eighth, Note B Three Sixteenth, Pause Sixteenth] <> [Pause Half] <> stimes (5 :: Int) [Pause Eighth, Note B Three Sixteenth, Pause Sixteenth]
        zNotes = [Note B Two Sixteenth, Note D Three Sixteenth, Note E Three Sixteenth, Note FSharp Three Sixteenth, Note B Two Sixteenth, Pause Sixteenth, Note B Two Eighth, Note B Two Sixteenth, Note D Three Sixteenth, Note E Three Sixteenth, Note FSharp Three Sixteenth, Note G Three Sixteenth, Note FSharp Three Sixteenth, Note D Three Sixteenth, Note E Three Eighth, Pause Eighth, Note D Three Sixteenth, Pause Sixteenth, Note FSharp Three Sixteenth, Note B Two Eighth, Pause Half, Note B Two Sixteenth, Note D Three Sixteenth, Note E Three Sixteenth, Note FSharp Three Sixteenth, Note B Two Sixteenth, Pause Sixteenth, Note B Two Eighth, Note B Two Sixteenth, Note D Three Sixteenth, Note E Three Sixteenth, Note FSharp Three Sixteenth, Note G Three Sixteenth, Note FSharp Three Sixteenth, Note D Three Sixteenth, Note E Three Eighth, Pause Eighth, Note D Three Sixteenth, Pause Sixteenth, Note FSharp Three Sixteenth, Note B Two Eighth]

sandstorm, ppk, axelf, children, numberone, rick :: Ringtone
sandstorm = "Sandstorm:d=16, o=3, b=120:16b3 16b3 16b3 16b3 8b3 16b3 16b3 16b3 16b3 16b3 16b3 8b3 16e4 16e4 16e4 16e4 16e4 16e4 8e4 16d4 16d4 16d4 16d4 16d4 16d4 8d4 8a3 16b3 16b3 16b3 16b3 4b3 16b3 16b3 16b3 16b3 8b3 8e4 16b3 16b3 16b3 16b3 4b3 16b3 16b3 16b3 16b3 4b3"
ppk = "PPKResur:d=4, o=6, b=140:2d, 8e, 8f, 8e, 2d, 8e, 8f, 8e, 8d, 8e, 8f, 8e, 8d, 8e, 8f, 8e, 8d, 8e, 8f, 8e, d, a5, 1c, 1p, a#5, f, 8g, 8f, 8e, 2f, 8g, 8f, 8e, 8f, 8g, 8f, 8e, 8f, 8g, 8f, 8e, 8f, 8g, 8f, 8e, f, e, 16f, 16e, 2d"
axelf = "axelf:d=4, o=5, b=117:f#, 8a., 8f#, 16f#, 8a#, 8f#, 8e, f#, 8c.6, 8f#, 16f#, 8d6, 8c#6, 8a, 8f#, 8c#6, 8f#6, 16f#, 8e, 16e, 8c#, 8g#, f#."
children = "Children:d=4, o=4, b=137:8p, f.5, 1p, g#5, 8g5, d#.5, 1p, g#5, 8g5, c.5, 1p, g#5, 8g5, g#., 1p, 16f, 16g, 16g#, 16c5, f.5, 1p, g#5, 8g5, d#.5, 1p, 16c#5, 16c5, c#5, 8c5, g#, 2p, g., g#, 8c5, f."
rick = "rickroll:d=4, o=5, b=120:16c, 16d, 16f, 16d, 16a., 16p, 32p, 8a, 16p, g., 16c, 16d, 16f, 16d, 16g., 16p, 32p, 8g, 16p, 8f., 16e, 8d, 16c, 16d, 16f, 16d, f, 8g, 8e., 16d, 8c, 8c4, 8c, 8g, 8p, 2f, 16c, 16d, 16f, 16d, 16a., 16p, 32p, 8a, 16p, g., 16c, 16d, 16f, 16d, c6, 8e, 8f., 16e, 8d, 16c, 16d, 16f, 16d, f, 8g, 8e., 16d, 8c, 8c4, 8c, 8g, 8p, 2f"
numberone = "NumberOne:d=16, o=5, b=168:4f., 8c6, 16b5, 16c6, 16b5, 16c6, 8b5, 8c6, 4g#5, 4f., 8f, 8g#5, 8c6, 4c#6, 4g#5, 4c#6, 4d#6, 8c6, 8c#6, 8c6, 8c#6, 2c6"

playRTTL :: Instrument -> String -> IO ()
playRTTL inst input = case parse input of
  Just (title, notes, bpm) -> playVLC [(title <> ".wav", bpm, [(inst, notes)])]
  Nothing -> putStrLn "Error"

playVLC :: [(FilePath, Beats, [Track])] -> IO ()
playVLC files = do
  mapM_ ((\f (a, b, c) -> f a b c) waves) files
  _ <- runCommand . printf "vlc %s vlc://quit" . unwords . map (\(a, b, c) -> a) $ files
  return ()

playFF :: FilePath -> Beats -> [Track] -> IO ()
playFF outputFilePath bpm tracks = do
  waves outputFilePath bpm tracks
  _ <- runCommand $ printf "ffplay -autoexit -showmode 1 -f f32le -ar %f %s" sampleRate outputFilePath
  return ()

waves :: FilePath -> Beats -> [Track] -> IO ()
waves filePath bpm = putWAVEFile filePath . WAVE (WAVEHeader 1 (round sampleRate) 32 Nothing) . map pure
                   . getAsInts . foldr1 (<+>) . map (\(i, ns) -> generateWave bpm i ns)

ps :: String -> IO ()
ps = playRTTL defaultInstrument