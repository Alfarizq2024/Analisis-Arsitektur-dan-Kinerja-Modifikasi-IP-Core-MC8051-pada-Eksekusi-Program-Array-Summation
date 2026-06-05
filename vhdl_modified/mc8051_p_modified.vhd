-------------------------------------------------------------------------------
-- Modifikasi: File mc8051_p.vhd dengan parameter yang diubah
-- Perubahan:
--   C_IMPL_N_SIU : 1 -> 0 (Mematikan Serial Interface Unit)
--   C_IMPL_N_TMR : 2 -> 1 (Mengurangi Timer/Counter dari 2 ke 1)
-- Tujuan: Menganalisis dampak rekonfigurasi terhadap arsitektur internal
--         dan performa eksekusi program
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

package mc8051_p is

  -- Konstanta untuk lebar data dan alamat
  constant C_DATA_WIDTH : natural := 8;    -- Lebar data 8-bit
  constant C_ADDR_WIDTH : natural := 16;   -- Lebar alamat 16-bit

  ===========================================================================
  -- PERUBAHAN KONFIGURASI UNTUK EKSPERIMEN REKONFIGURASI
  ===========================================================================

  -- Jumlah Serial Interface Unit (SIU)
  -- Asli: C_IMPL_N_SIU = 1
  -- Modifikasi: C_IMPL_N_SIU = 0 (SIU dinonaktifkan)
  constant C_IMPL_N_SIU : natural := 0;

  -- Jumlah Timer/Counter
  -- Asli: C_IMPL_N_TMR = 2
  -- Modifikasi: C_IMPL_N_TMR = 1 (Timer dikurangi menjadi 1)
  constant C_IMPL_N_TMR : natural := 1;

  ===========================================================================

  -- Konstanta lainnya tetap sama
  constant C_IMPL_N_ADD : natural := 1;    -- Jumlah ALU adder
  constant C_IMPL_N_MUL : natural := 1;    -- Jumlah multiplier
  constant C_IMPL_N_DIV : natural := 1;    -- Jumlah divider

  subtype t_range_siu is natural range 0 to C_IMPL_N_SIU-1;
  subtype t_range_tmr is natural range 0 to C_IMPL_N_TMR-1;

end package mc8051_p;
