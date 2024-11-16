library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.util_sim.all;
use std.env.finish;

entity sim_ConjuntodeRegistros_32x32_b is
end sim_ConjuntodeRegistros_32x32_b;

architecture sim of sim_ConjuntodeRegistros_32x32_b is
  component ConjuntodeRegistros_32x32_b is
    port (
      clk,hab_escritura: in std_logic;
      dir_escritura, dir_lectura_1 ,dir_lectura_2 :in std_logic_vector (31 downto 0);
      dat_escritura :in std_logic_vector (31 downto 0);
      dat_lectura_1, dat_lectura_2 :out std_logic_vector (31 downto 0)
    );
  end component; -- ConjuntodeRegistros_32x32_b

  
  signal clk_tb: std_logic := '0';
  signal hab_escritura_tb: std_logic := '0';
  signal dir_escritura_tb, dir_lectura_1_tb, dir_lectura_2_tb: std_logic_vector(31 downto 0);
  signal dat_escritura_tb: std_logic_vector(31 downto 0);
  signal dat_lectura_1_tb, dat_lectura_2_tb: std_logic_vector(31 downto 0);

begin
  
  -- Dispositivo bajo prueba
  dut : ConjuntodeRegistros_32x32_b port map (clk => clk_tb,
                                              hab_escritura => hab_escritura_tb,
                                              dir_escritura => dir_escritura_tb,
                                              dir_lectura_1 => dir_lectura_1_tb,
                                              dir_lectura_2 => dir_lectura_2_tb,
                                              dat_escritura => dat_escritura_tb,
                                              dat_lectura_1 => dat_lectura_1_tb,
                                              dat_lectura_2 => dat_lectura_2_tb);

    reloj: process
    begin
      clk <='0';
    wait for 1 ns;
    clk <= '1';
    wait for 1 ns;
    end process;



end sim;
