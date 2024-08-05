#
# MIT License
#
# Copyright (c) 2024 nbiotcloud
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

"""
Base Memory.
"""

from functools import cached_property

import ucdp as u
from ucdp_addr.addrspace import Addrspace
from ucdp_addr.util import calc_depth_size
from ucdp_glbl.lane import Lanes, fill_lanes

from .types import LanesMemIoType, MemIoType, MemPwrType, MemTechType, SliceWidths
from .wordmasks import Wordmasks, cast_wordmasks, width_to_wordmasks


class AMemMod(u.ATailoredMod):
    """Memory Module."""

    width: int = 32
    """Width in Bits."""
    depth: int = u.Field(repr=False)
    """Number of words."""
    size: u.Bytes
    """Size in Bytes."""
    slicewidths: SliceWidths | None = None
    """Data Slice Widths."""
    wordmasks: Wordmasks
    """Word Masks for 32-bit mapping."""
    accesslanes: Lanes | None = None
    """Access Lanes."""
    powerlanes: Lanes | None = None
    """Access Lanes."""

    writable: u.ClassVar[bool] = False
    rewritable: u.ClassVar[bool] = False

    def __init__(
        self,
        *args,
        width: int,
        depth: int | None = None,
        size: u.Bytes | None = None,
        wordmasks: Wordmasks | None = None,
        accesslanes: Lanes | None = None,
        powerlanes: Lanes | None = None,
        **kwargs,
    ):
        depth, size = calc_depth_size(width, depth, size)
        size = u.Bytesize(size)
        wordmasks = cast_wordmasks(wordmasks, width=width) if wordmasks else width_to_wordmasks(width)
        accesslanes = fill_lanes(accesslanes, size) if accesslanes else None
        powerlanes = fill_lanes(powerlanes, size) if powerlanes else None
        super().__init__(
            *args,
            width=width,
            depth=depth,
            size=size,
            accesslanes=accesslanes,
            powerlanes=powerlanes,
            wordmasks=wordmasks,
            **kwargs,
        )

    def _build(self) -> None:
        self.add_port(u.ClkRstAnType(), "main_i")
        self.add_port(self.iotype, "io_i")
        self.add_port(self.pwrtype, "pwr_i")
        self.add_port(self.techtype, "tech_i")

    @cached_property
    def iotype(self) -> LanesMemIoType | MemIoType:
        """IO Type."""
        if self.accesslanes:
            return LanesMemIoType(
                datawidth=self.width,
                writable=self.writable,
                slicewidths=self.slicewidths,
                lanes=self.accesslanes,
            )
        return MemIoType(
            datawidth=self.width,
            addrwidth=u.log2(self.depth - 1),
            writable=self.writable,
            slicewidths=self.slicewidths,
        )

    @cached_property
    def pwrtype(self) -> MemPwrType:
        """Power Control Type."""
        return MemPwrType()

    @cached_property
    def techtype(self) -> MemTechType:
        """Technology Parameter Power."""
        return MemTechType()

    @cached_property
    def addrspace(self) -> Addrspace:
        """Address Space."""
        return Addrspace(name=self.hiername, width=self.width, depth=self.depth)

    def get_overview(self) -> str:
        """Overview."""
        wordmasks = ", ".join(str(mask) for mask in self.wordmasks)
        accesslanes = ", ".join(f"{lane.name}='{lane.size}'" for lane in self.accesslanes) if self.accesslanes else "-"
        powerlanes = ", ".join(f"{lane.name}='{lane.size}'" for lane in self.powerlanes) if self.powerlanes else "-"
        lines = [
            f"Org:         {self.addrspace.org}",
            f"Wordmasks:   {wordmasks}",
            f"Accesslanes: {accesslanes}",
            f"Powerlanes:  {powerlanes}",
        ]
        return "\n".join(lines)
