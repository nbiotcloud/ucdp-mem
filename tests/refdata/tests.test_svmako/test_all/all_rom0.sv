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
// Module:     tests.all_rom0
// Data Model: tests.test_svmako.RomMod
//
//
// Org:         100x8 (100 bytes)
// Wordmasks:   0xFF
// Accesslanes: -
// Powerlanes:  -
// Constraints: -
// Segmentation:
//     y/x    0
//      0  100x8/1
//     Total: 100x8/1(100 bytes)
//
// =============================================================================

`begin_keywords "1800-2009"
`default_nettype none  // implicit wires are forbidden

module all_rom0 ( // tests.test_svmako.RomMod
  // main_i
  input  wire                   main_clk_i,
  input  wire                   main_rst_an_i, // Async Reset (Low-Active)
  // io_i
  input  wire                   io_ena_i,
  input  wire  [$clog2(99)-1:0] io_addr_i,
  output logic [7:0]            io_rdata_o
  // pwr_i
  // tech_i
);


endmodule // all_rom0

`default_nettype wire
`end_keywords
