"""Pytest Configuration and Fixtures."""

import os
from unittest import mock

from pytest import fixture


@fixture
def prjroot(tmp_path):
    """Emulate prjroot."""
    with mock.patch.dict(os.environ, {"PRJROOT": str(tmp_path)}):
        yield tmp_path
