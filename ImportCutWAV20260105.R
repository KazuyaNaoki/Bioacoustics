##### Manejo de archivos de sonidos (*.wav) ####
## Debe modificar para tratar varios wav files ##
## 5 jan 2026 ##

rm(list=ls()); graphics.off()

library(tuneR) # For reading and writing WAV files. (readWave)

setwd("F:/DatosGrabacion/Grabacion 202503 SaraAna"); getwd()

# dir.create("TEMP")

#### 1. Import Audio File ####

rm(list=ls())

### Setting ###
audio_file <- "Sonido - SaraAna bos1 - 20250311-30 - 2MM04600/Data/2MM04600_20250312_090002.wav" # Replace with your file path

output_file <- "BOS1_20250312_090002_10MIN.wav"
output_file2 <- "BOS1_20250312_090002_5MIN.wav"

## 

sound_data <- readWave(audio_file) # import wav file
print(sound_data)

#### 2. Extract audio file ####

# Extract 30:00 to 40:00 (30-40 minute section)
start_time <- 30 * 60  # 30 minutes in seconds = 1800 seconds
end_time <- 40 * 60    # 40 minutes in seconds = 2400 seconds

# Extract the segment
segment_30_40 <- extractWave(sound_data, 
                             from = start_time, 
                             to = end_time, 
                             xunit = "time")

print(segment_30_40)

# Save the extracted segment

output_path <- file.path("TEMP10MIN", output_file)
writeWave(segment_30_40, output_path)

#### 2a. Extract audio file - 5 min ####

start_time <- 30 * 60  # 30 minutes in seconds = 1800 seconds
end_time2 <- 35 * 60    # 40 minutes in seconds = 2400 seconds

segment_30_35 <- extractWave(sound_data, 
                             from = start_time, 
                             to = end_time2, 
                             xunit = "time")
print(segment_30_35)
output_path2 <- file.path("TEMP5MIN", output_file2)
writeWave(segment_30_35, output_path2)

