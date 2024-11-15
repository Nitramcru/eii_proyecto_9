library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_ConjuntodeRegistros_32x32_b is
end sim_ConjuntodeRegistros_32x32_b;

architecture sim of sim_ConjuntodeRegistros_32x32_b is
  component ConjuntodeRegistros_32x32_b is
    port (
      clk,hab_escritura: in std_logic;
  
      dir_escritura, dir_lectura_1 ,dir_lectura_2 :in std_logic_vector (32 downto 0);
      dat_escritura :in std_logic_vector (31 downto 0);
      dat_lectura_1, dat_lectura_2 :out std_logic_vector (31 downto 0);
    );
  end component; -- ConjuntodeRegistros_32x32_b
  signal men : std_logic_vector (31 downto 0);

begin
  -- Dispositivo bajo prueba
  dut : ConjuntodeRegistros_32x32_b port map ();

  excitaciones: process
  begin
    for i in 0 to (2**men'length)-1 loop
      men <= std_logic_vector(to_unsigned(i,men'length));
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
