# setup_sim_modified.do - Script simulasi MC8051 dengan konfigurasi modifikasi
# Platform: ModelSim SE/PE
# Deskripsi: Script ini menggunakan file mc8051_p.vhd yang sudah dimodifikasi
#            (C_IMPL_N_SIU=0, C_IMPL_N_TMR=1) untuk eksperimen rekonfigurasi

# 1. Bersihkan library lama (jika ada)
vdel -lib work -all

# 2. Buat library baru
vlib work
vmap work work

# 3. Kompilasi file package yang sudah dimodifikasi terlebih dahulu
vcom ../vhdl_modified/mc8051_p_modified.vhd

# 4. Kompilasi semua file VHDL lainnya
vcom ../vhdl/mc8051_control_.vhd
vcom ../vhdl/mc8051_control_rtl.vhd
vcom ../vhdl/mc8051_control_rtl_cfg.vhd
vcom ../vhdl/mc8051_alu_.vhd
vcom ../vhdl/mc8051_alu_rtl.vhd
vcom ../vhdl/mc8051_alu_rtl_cfg.vhd
# ... (file lainnya sesuai urutan mc8051_compile.do)

# 5. Muat testbench
vsim work.tb_mc8051_top_sim_cfg

# 6. Tambahkan sinyal ke wave window
do mc8051_wave.do

# 7. Log semua sinyal
log -r *

# 8. Jalankan simulasi
run -all

# 9. Zoom ke awal simulasi
wave zoom full
