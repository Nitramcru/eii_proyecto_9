library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Memoria_RAM_512x8_B is
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
end Memoria_RAM_512x8_B;


architecture arch of Memoria_RAM_512x8_B is
  type mem_t is array (0 to 511) of std_logic_vector (7 downto 0);

  signal mem : mem_t:= ( others => (others => '0'));
begin

  puerto_lectura: process (clk_lectura)
  begin
    if rising_edge (clk_lectura) then
      if hab_lectura = '1' then 
        dat_lectura <= mem(to_integer (unsigned (dir_lectura)));
      end if;
    end if;
  end process;


  puerto_escritura: process (clk_escritura)
  begin
    if rising_edge (clk_escritura ) then
      if hab_escritura = '1' then
        mem (to_integer (unsigned (dir_escritura))) <= dat_escritura;
      end if;
    end if;
  end process;
  
end arch;