# setup_sim.do - Script lengkap simulasi MC8051
# Platform: ModelSim SE/PE
# Deskripsi: Script ini menjalankan seluruh proses simulasi dari awal

# 1. Bersihkan library lama (jika ada)
vdel -lib work -all

# 2. Buat library baru
vlib work
vmap work work

# 3. Kompilasi semua file VHDL
do mc8051_compile.do

# 4. Muat testbench
vsim work.tb_mc8051_top_sim_cfg

# 5. Tambahkan sinyal ke wave window
do mc8051_wave.do

# 6. Log semua sinyal
log -r *

# 7. Jalankan simulasi
run -all

# 8. Zoom ke awal simulasi
wave zoom full
