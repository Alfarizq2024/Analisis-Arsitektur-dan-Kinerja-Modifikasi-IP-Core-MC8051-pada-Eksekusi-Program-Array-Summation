#!/bin/bash
# convert_hex.sh - Script untuk mengkonversi file .hex ke format .dua
# Kebutuhan: GCC compiler untuk kompilasi hex2dual.c

echo "=== Konversi Intel HEX ke Format .dua ==="

# Kompilasi utilitas hex2dual jika belum ada
if [ ! -f hex2dual ]; then
    echo "[1/3] Kompilasi hex2dual.c..."
    gcc hex2dual.c -o hex2dual
    if [ $? -ne 0 ]; then
        echo "ERROR: Gagal mengompilasi hex2dual.c"
        exit 1
    fi
    echo "hex2dual berhasil dikompilasi."
else
    echo "[1/3] hex2dual sudah ada, melewati kompilasi."
fi

# Konversi file HEX untuk program standar
echo "[2/3] Mengkonversi array_sum.hex ke mc8051_rom.dua..."
./hex2dual ../src/array_sum.hex
cp array_sum.dua mc8051_rom.dua
echo "File mc8051_rom.dua berhasil dibuat."

# Konversi file HEX untuk program teroptimasi (opsional)
echo "[3/3] Mengkonversi array_sum_optimized.hex..."
./hex2dual ../src/array_sum_optimized.hex
cp array_sum_optimized.dua mc8051_rom_opt.dua
echo "File mc8051_rom_opt.dua berhasil dibuat."

echo "=== Konversi selesai ==="
