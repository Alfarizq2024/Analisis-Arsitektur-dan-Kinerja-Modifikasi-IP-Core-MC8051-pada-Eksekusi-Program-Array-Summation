;=============================================================================
; Program: Array Summation
; Platform: MC8051 IP Core (Oregano Systems) v1.6
; Deskripsi: Program ini menjumlahkan isi dari 5 blok memori RAM internal
;            (alamat 40H-44H) menggunakan metode perulangan (looping)
;            dengan instruksi DJNZ (Decrement and Jump if Not Zero).
;=============================================================================

ORG 0000H          ; Program dimulai dari alamat 0000H

;---- Fase 1: Inisialisasi Data ----
; Mengisi RAM internal alamat 40H-44H dengan data arbitrer
MOV 40H, #05H     ; Memori[40H] = 5
MOV 41H, #0AH     ; Memori[41H] = 10
MOV 42H, #03H     ; Memori[42H] = 3
MOV 43H, #07H     ; Memori[43H] = 7
MOV 44H, #01H     ; Memori[44H] = 1
                   ; Total yang diharapkan: 5+10+3+7+1 = 26 (1AH)

;---- Fase 2: Setup Pointer dan Counter ----
MOV R0, #40H      ; R0 = pointer ke alamat awal array (40H)
MOV R7, #05H      ; R7 = counter perulangan (5 iterasi)
MOV A, #00H       ; A = Accumulator di-reset ke 0

;---- Fase 3: Loop Penjumlahan ----
LOOP:
  ADD A, @R0      ; Tambahkan nilai di alamat yang ditunjuk R0 ke Accumulator
  INC R0          ; Increment pointer R0 ke alamat berikutnya
  DJNZ R7, LOOP   ; Decrement R7, lompat ke LOOP jika R7 != 0

;---- Fase 4: Simpan Hasil ----
MOV 50H, A        ; Simpan hasil penjumlahan ke alamat 50H

;---- Fase 5: Instruksi Penghenti ----
SJMP $             ; Infinite loop (halt program)

END
