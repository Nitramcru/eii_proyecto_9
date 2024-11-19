library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.util_sim.all;
use std.env.finish;

entity sim_Memoria_RAM_512x8_B is
end sim_Memoria_RAM_512x8_B;

architecture sim of sim_Memoria_RAM_512x8_B is
  component Memoria_RAM_512x8_B is
    port (
    clk_escritura :in std_logic;
    dir_escritura :in std_logic_vector (8 downto 0);
    hab_escritura :in std_logic;
    dat_escritura :in std_logic_vector (7 downto 0);

    clk_lectura :in std_logic;
    dir_lectura :in std_logic_vector (8 downto 0);
    hab_lectura :in std_logic;
    dat_lectura :out std_logic_vector (7 downto 0)
    );
  end component; -- Memoria_RAM_512x8_B


  signal clk: std_logic ;
  signal dir: std_logic_vector(8 downto 0) ;
  signal hab_escritura_tb : std_logic ;
  signal dat_escritura_tb : std_logic_vector(7 downto 0) ;
  signal dat_lectura_tb : std_logic_vector(7 downto 0);

begin
  
  
  -- Dispositivo bajo prueba
  dut : Memoria_RAM_512x8_B port map (clk_escritura => clk,
                                      dir_escritura => dir,
                                      hab_escritura => hab_escritura_tb,
                                      dat_escritura => dat_escritura_tb,

                                      clk_lectura => clk,
                                      dir_lectura => dir,
                                      hab_lectura => '1',
                                      dat_lectura => dat_lectura_tb );

reloj: process
begin
  clk <='0';
wait for 1 ns;
  clk <= '1';
wait for 1 ns;
end process;



estimulo: process
variable aleatorio : aleatorio_t;
procedure sig_ciclo is
begin
  
  wait until rising_edge (clk);
  wait for 0.5 ns;
  end procedure;


  begin

    for i in 0 to 99 loop
      dir <= aleatorio.genera_vector(9);
      dat_escritura_tb <= (others => '0');
      hab_escritura_tb <= '1';
      sig_ciclo;

      dat_escritura_tb <= aleatorio.genera_vector(8);
      hab_escritura_tb <= aleatorio.genera_bit;
      sig_ciclo;

      hab_escritura_tb <='0';
      sig_ciclo;

    end loop;

    sig_ciclo;
      
    finish;
    end process;



end sim;