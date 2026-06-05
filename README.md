# MC8051 Array Summation — Analisis Arsitektur dan Kinerja

Proyek tugas mata kuliah **Organisasi dan Arsitektur Komputer** yang menganalisis eksekusi program Array Summation pada platform Oregano MC8051 IP Core menggunakan ModelSim.

## Platform

- **IP Core**: MC8051 Version 1.6 — Oregano Systems
- **Simulator**: ModelSim SE/PE (Mentor Graphics / Siemens EDA)
- **Bahasa Deskripsi**: VHDL

## Struktur Repositori

```
.
├── src/
│   ├── array_sum.asm              # Program utama (loop DJNZ)
│   ├── array_sum.hex              # Intel HEX format (asli)
│   ├── array_sum_optimized.asm    # Program optimasi (loop unrolling)
│   └── array_sum_optimized.hex    # Intel HEX format (optimasi)
├── vhdl_modified/
│   └── mc8051_p_modified.vhd      # File VHDL modifikasi (SIU=0, TMR=1)
├── docs/
│   └── laporan_mc8051.pdf         # Laporan IEEE Conference
├── scripts/
│   ├── setup_sim.do               # Script simulasi standar
│   ├── setup_sim_modified.do      # Script simulasi modifikasi
│   └── convert_hex.sh             # Script konversi HEX ke .dua
├── figures/
│   ├── arch_diagram.png           # Diagram arsitektur
│   ├── flowchart.png              # Flowchart eksperimen
│   └── loop_timing.png            # Diagram timing
└── README.md
```

## Program yang Dijalankan

### Array Summation (Loop DJNZ)
Menjumlahkan 5 elemen array (alamat 40H–44H) menggunakan perulangan dengan instruksi `DJNZ`.

### Array Summation (Loop Unrolling)
Versi optimasi tanpa perulangan — operasi ADD dilakukan secara berurutan untuk mengurangi overhead branching.

## Eksperimen Modifikasi

Konfigurasi standar MC8051 dimodifikasi:
- `C_IMPL_N_SIU`: 1 → 0 (Serial Interface dinonaktifkan)
- `C_IMPL_N_TMR`: 2 → 1 (Timer dikurangi menjadi 1)

Hasil modifikasi:
- Penghematan ~20% LUT pada implementasi FPGA
- Fungsionalitas ALU dan eksekusi program tetap utuh
- Waktu eksekusi identik (periferal independen dari inti prosesor)

## Cara Menjalankan

1. Ekstrak `mc8051_design_v1.6.zip` ke direktori kerja
2. Konversi file HEX ke format .dua:
   ```bash
   cd msim/
   gcc hex2dual.c -o hex2dual
   ./hex2dual ../src/array_sum.hex
   cp array_sum.dua mc8051_rom.dua
   ```
3. Jalankan ModelSim:
   ```tcl
   vlib work
   vmap work work
   do mc8051_compile.do
   vsim work.tb_mc8051_top_sim_cfg
   do mc8051_wave.do
   run -all
   ```

## Anggota Kelompok

| Nama | NPM |
|------|-----|
| Nama Anggota 1 | 12345678 |
| Nama Anggota 2 | 12345678 |
| Nama Anggota 3 | 12345678 |
