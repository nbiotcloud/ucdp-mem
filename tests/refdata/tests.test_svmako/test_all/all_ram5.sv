// =============================================================================
//
// THIS FILE IS GENERATED!!! DO NOT EDIT MANUALLY. CHANGES ARE LOST.
//
// =============================================================================
//
//  MIT License
//
//  Copyright (c) 2024 nbiotcloud
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
// =============================================================================
//
// Module:     tests.all_ram5
// Data Model: tests.test_svmako.RamMod
//
//
// Org:         18204x18 (40959 bytes)
// Wordmasks:   0x3FFFF
// Accesslanes: one='8 KB', two='32 KB'
// Powerlanes:  one='4 KB', two='36 KB'
//
// =============================================================================

`begin_keywords "1800-2009"
`default_nettype none  // implicit wires are forbidden

module all_ram5 ( // tests.test_svmako.RamMod
  // main_i
  input  wire                      main_clk_i,
  input  wire                      main_rst_an_i,  // Async Reset (Low-Active)
  // io_i
  // io_one_i
  input  wire                      io_one_ena_i,
  input  wire  [$clog2(3639)-1:0]  io_one_addr_i,
  input  wire                      io_one_wena_i,
  input  wire  [17:0]              io_one_wdata_i,
  output logic [17:0]              io_one_rdata_o,
  // io_two_i
  input  wire                      io_two_ena_i,
  input  wire  [$clog2(14562)-1:0] io_two_addr_i,
  input  wire                      io_two_wena_i,
  input  wire  [17:0]              io_two_wdata_i,
  output logic [17:0]              io_two_rdata_o
  // pwr_i
  // tech_i
);


endmodule // all_ram5

`default_nettype wire
`end_keywords
