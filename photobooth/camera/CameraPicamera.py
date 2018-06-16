#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Photobooth - a flexible photo booth software
# Copyright (C) 2018  Balthasar Reuter <photobooth at re - web dot eu>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

import io
import logging

from PIL import Image

from picamera import PiCamera

from . import Camera


class CameraPicamera(Camera):

    def __init__(self):

        super().__init__()

        self.hasPreview = True
        self.hasIdle = False

        logging.info('Using PiCamera')

        self._cap = PiCamera()

    def getPreview(self):

        stream = io.BytesIO()
        self._cap.capture(stream, format='rgb', use_video_port=True)
        stream.seek(0)
        return Image.fromarray(stream)

    def getPicture(self):

        stream = io.BytesIO()
        self._cap.capture(stream, format='rgb')
        stream.seek(0)
        return Image.fromarray(stream)