;=============================================================================
; Program: Array Summation (Optimized - Loop Unrolling)
; Platform: MC8051 IP Core (Oregano Systems) v1.6
; Deskripsi: Versi teroptimasi dari Array Summation menggunakan teknik
;            loop unrolling untuk mengurangi overhead instruksi DJNZ.
;            Alih-alih 5 iterasi loop, operasi ADD dilakukan secara
;            berurutan tanpa branching, lalu hasilnya disimpan.
;=============================================================================

ORG 0000H          ; Program dimulai dari alamat 0000H

;---- Fase 1: Inisialisasi Data ----
MOV 40H, #05H     ; Memori[40H] = 5
MOV 41H, #0AH     ; Memori[41H] = 10
MOV 42H, #03H     ; Memori[42H] = 3
MOV 43H, #07H     ; Memori[43H] = 7
MOV 44H, #01H     ; Memori[44H] = 1
                   ; Total yang diharapkan: 5+10+3+7+1 = 26 (1AH)

;---- Fase 2: Penjumlahan Langsung (Loop Unrolling) ----
MOV A, 40H        ; A = Memori[40H] = 5
ADD A, 41H        ; A = A + Memori[41H] = 5 + 10 = 15
ADD A, 42H        ; A = A + Memori[42H] = 15 + 3 = 18
ADD A, 43H        ; A = A + Memori[43H] = 18 + 7 = 25
ADD A, 44H        ; A = A + Memori[44H] = 25 + 1 = 26

;---- Fase 3: Simpan Hasil ----
MOV 50H, A        ; Simpan hasil penjumlahan ke alamat 50H

;---- Fase 4: Instruksi Penghenti ----
SJMP $             ; Infinite loop (halt program)

END
