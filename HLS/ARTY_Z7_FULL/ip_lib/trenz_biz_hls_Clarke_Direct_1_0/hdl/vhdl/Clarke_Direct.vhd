-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.1
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Clarke_Direct is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_V_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    s_axis_V_TVALID : IN STD_LOGIC;
    s_axis_V_TREADY : OUT STD_LOGIC;
    m_axis_V_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_V_TVALID : OUT STD_LOGIC;
    m_axis_V_TREADY : IN STD_LOGIC );
end;


architecture behav of Clarke_Direct is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "Clarke_Direct,hls_ip_2017_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.380000,HLS_SYN_LAT=3,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=1,HLS_SYN_FF=332,HLS_SYN_LUT=132}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv16_8000 : STD_LOGIC_VECTOR (15 downto 0) := "1000000000000000";
    constant ap_const_lv16_8001 : STD_LOGIC_VECTOR (15 downto 0) := "1000000000000001";
    constant ap_const_lv32_93CD : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000001001001111001101";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal s_axis_V_0_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_vld_in : STD_LOGIC;
    signal s_axis_V_0_vld_out : STD_LOGIC;
    signal s_axis_V_0_ack_in : STD_LOGIC;
    signal s_axis_V_0_ack_out : STD_LOGIC;
    signal s_axis_V_0_payload_A : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_payload_B : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_sel_rd : STD_LOGIC := '0';
    signal s_axis_V_0_sel_wr : STD_LOGIC := '0';
    signal s_axis_V_0_sel : STD_LOGIC;
    signal s_axis_V_0_load_A : STD_LOGIC;
    signal s_axis_V_0_load_B : STD_LOGIC;
    signal s_axis_V_0_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal s_axis_V_0_state_cmp_full : STD_LOGIC;
    signal m_axis_V_1_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_vld_in : STD_LOGIC;
    signal m_axis_V_1_vld_out : STD_LOGIC;
    signal m_axis_V_1_ack_in : STD_LOGIC;
    signal m_axis_V_1_ack_out : STD_LOGIC;
    signal m_axis_V_1_payload_A : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_payload_B : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_sel_rd : STD_LOGIC := '0';
    signal m_axis_V_1_sel_wr : STD_LOGIC := '0';
    signal m_axis_V_1_sel : STD_LOGIC;
    signal m_axis_V_1_load_A : STD_LOGIC;
    signal m_axis_V_1_load_B : STD_LOGIC;
    signal m_axis_V_1_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal m_axis_V_1_state_cmp_full : STD_LOGIC;
    signal s_axis_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal m_axis_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal Ia_fu_65_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal Ia_reg_144 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_s_reg_149 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_4_reg_155 : STD_LOGIC_VECTOR (31 downto 0);
    signal res_fu_126_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_1_fu_73_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_5_fu_83_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal grp_fu_135_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_8_fu_114_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_fu_119_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_135_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);

    component Clarke_Direct_am_bkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (16 downto 0);
        din1 : IN STD_LOGIC_VECTOR (15 downto 0);
        din2 : IN STD_LOGIC_VECTOR (16 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    Clarke_Direct_am_bkb_U0 : component Clarke_Direct_am_bkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 17,
        din1_WIDTH => 16,
        din2_WIDTH => 17,
        dout_WIDTH => 32)
    port map (
        din0 => tmp_5_fu_83_p3,
        din1 => Ia_fu_65_p1,
        din2 => grp_fu_135_p2,
        dout => grp_fu_135_p3);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    m_axis_V_1_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_sel_rd <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_logic_1 = m_axis_V_1_vld_out))) then 
                                        m_axis_V_1_sel_rd <= not(m_axis_V_1_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    m_axis_V_1_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_sel_wr <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_in))) then 
                                        m_axis_V_1_sel_wr <= not(m_axis_V_1_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    m_axis_V_1_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_state <= ap_const_lv2_0;
            else
                if ((((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_lv2_3 = m_axis_V_1_state)) or ((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_lv2_2 = m_axis_V_1_state)))) then 
                    m_axis_V_1_state <= ap_const_lv2_2;
                elsif ((((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_0 = m_axis_V_1_ack_out) and (ap_const_lv2_3 = m_axis_V_1_state)) or ((ap_const_logic_0 = m_axis_V_1_ack_out) and (ap_const_lv2_1 = m_axis_V_1_state)))) then 
                    m_axis_V_1_state <= ap_const_lv2_1;
                elsif ((((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_lv2_2 = m_axis_V_1_state)) or ((ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_lv2_1 = m_axis_V_1_state)) or ((ap_const_lv2_3 = m_axis_V_1_state) and not(((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_0 = m_axis_V_1_ack_out))) and not(((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_out)))))) then 
                    m_axis_V_1_state <= ap_const_lv2_3;
                else 
                    m_axis_V_1_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_sel_rd <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = s_axis_V_0_ack_out) and (ap_const_logic_1 = s_axis_V_0_vld_out))) then 
                                        s_axis_V_0_sel_rd <= not(s_axis_V_0_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_sel_wr <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_in))) then 
                                        s_axis_V_0_sel_wr <= not(s_axis_V_0_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_state <= ap_const_lv2_0;
            else
                if ((((ap_const_logic_0 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_3)) or ((ap_const_logic_0 = s_axis_V_0_vld_in) and (s_axis_V_0_state = ap_const_lv2_2)))) then 
                    s_axis_V_0_state <= ap_const_lv2_2;
                elsif ((((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_0 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_3)) or ((ap_const_logic_0 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_1)))) then 
                    s_axis_V_0_state <= ap_const_lv2_1;
                elsif ((((ap_const_logic_1 = s_axis_V_0_vld_in) and (s_axis_V_0_state = ap_const_lv2_2)) or ((ap_const_logic_1 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_1)) or ((s_axis_V_0_state = ap_const_lv2_3) and not(((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_0 = s_axis_V_0_ack_out))) and not(((ap_const_logic_0 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_out)))))) then 
                    s_axis_V_0_state <= ap_const_lv2_3;
                else 
                    s_axis_V_0_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then
                Ia_reg_144 <= Ia_fu_65_p1;
                tmp_4_reg_155 <= s_axis_V_0_data_out(63 downto 32);
                tmp_s_reg_149 <= grp_fu_135_p3(31 downto 16);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = m_axis_V_1_load_A)) then
                m_axis_V_1_payload_A <= res_fu_126_p4;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = m_axis_V_1_load_B)) then
                m_axis_V_1_payload_B <= res_fu_126_p4;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = s_axis_V_0_load_A)) then
                s_axis_V_0_payload_A <= s_axis_V_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = s_axis_V_0_load_B)) then
                s_axis_V_0_payload_B <= s_axis_V_TDATA;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, s_axis_V_0_vld_out, m_axis_V_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (m_axis_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (m_axis_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    Ia_fu_65_p1 <= s_axis_V_0_data_out(16 - 1 downto 0);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_done_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    grp_fu_135_p2 <= ap_const_lv32_93CD(17 - 1 downto 0);
    m_axis_V_1_ack_in <= m_axis_V_1_state(1);
    m_axis_V_1_ack_out <= m_axis_V_TREADY;

    m_axis_V_1_data_out_assign_proc : process(m_axis_V_1_payload_A, m_axis_V_1_payload_B, m_axis_V_1_sel)
    begin
        if ((ap_const_logic_1 = m_axis_V_1_sel)) then 
            m_axis_V_1_data_out <= m_axis_V_1_payload_B;
        else 
            m_axis_V_1_data_out <= m_axis_V_1_payload_A;
        end if; 
    end process;

    m_axis_V_1_load_A <= (m_axis_V_1_state_cmp_full and not(m_axis_V_1_sel_wr));
    m_axis_V_1_load_B <= (m_axis_V_1_sel_wr and m_axis_V_1_state_cmp_full);
    m_axis_V_1_sel <= m_axis_V_1_sel_rd;
    m_axis_V_1_state_cmp_full <= '0' when (m_axis_V_1_state = ap_const_lv2_1) else '1';

    m_axis_V_1_vld_in_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state3)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            m_axis_V_1_vld_in <= ap_const_logic_1;
        else 
            m_axis_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    m_axis_V_1_vld_out <= m_axis_V_1_state(0);
    m_axis_V_TDATA <= m_axis_V_1_data_out;

    m_axis_V_TDATA_blk_n_assign_proc : process(m_axis_V_1_state, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            m_axis_V_TDATA_blk_n <= m_axis_V_1_state(1);
        else 
            m_axis_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_V_TVALID <= m_axis_V_1_state(0);
    res_fu_126_p4 <= ((tmp_4_reg_155 & tmp_3_fu_119_p3) & Ia_reg_144);
    s_axis_V_0_ack_in <= s_axis_V_0_state(1);

    s_axis_V_0_ack_out_assign_proc : process(s_axis_V_0_vld_out, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then 
            s_axis_V_0_ack_out <= ap_const_logic_1;
        else 
            s_axis_V_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_V_0_data_out_assign_proc : process(s_axis_V_0_payload_A, s_axis_V_0_payload_B, s_axis_V_0_sel)
    begin
        if ((ap_const_logic_1 = s_axis_V_0_sel)) then 
            s_axis_V_0_data_out <= s_axis_V_0_payload_B;
        else 
            s_axis_V_0_data_out <= s_axis_V_0_payload_A;
        end if; 
    end process;

    s_axis_V_0_load_A <= (s_axis_V_0_state_cmp_full and not(s_axis_V_0_sel_wr));
    s_axis_V_0_load_B <= (s_axis_V_0_sel_wr and s_axis_V_0_state_cmp_full);
    s_axis_V_0_sel <= s_axis_V_0_sel_rd;
    s_axis_V_0_state_cmp_full <= '0' when (s_axis_V_0_state = ap_const_lv2_1) else '1';
    s_axis_V_0_vld_in <= s_axis_V_TVALID;
    s_axis_V_0_vld_out <= s_axis_V_0_state(0);

    s_axis_V_TDATA_blk_n_assign_proc : process(s_axis_V_0_state, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            s_axis_V_TDATA_blk_n <= s_axis_V_0_state(0);
        else 
            s_axis_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_axis_V_TREADY <= s_axis_V_0_state(1);
    tmp_1_fu_73_p4 <= s_axis_V_0_data_out(31 downto 16);
    tmp_3_fu_119_p3 <= 
        ap_const_lv16_8001 when (tmp_8_fu_114_p2(0) = '1') else 
        tmp_s_reg_149;
    tmp_5_fu_83_p3 <= (tmp_1_fu_73_p4 & ap_const_lv1_0);
    tmp_8_fu_114_p2 <= "1" when (tmp_s_reg_149 = ap_const_lv16_8000) else "0";
end behav;
