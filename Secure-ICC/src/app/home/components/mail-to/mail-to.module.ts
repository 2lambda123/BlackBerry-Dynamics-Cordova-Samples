/*
* Copyright 2023 BlackBerry Ltd.
*
* Licensed to the Apache Software Foundation (ASF) under one
* or more contributor license agreements.  See the NOTICE file
* distributed with this work for additional information
* regarding copyright ownership.  The ASF licenses this file
* to you under the Apache License, Version 2.0 (the
* "License"); you may not use this file except in compliance
* with the License.  You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*/

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { ReactiveFormsModule } from '@angular/forms';

import { MailToComponent } from './mail-to.component';
import { MailToService } from './mail-to.service';
import { FileSystemService } from '../file-system/file-system.service';
import { CreateFileFormModule } from '../create-file-form/create-file-form.module';
import { CreateFileModalComponent } from './create-file-modal/create-file-modal.component';

@NgModule({
  declarations: [
    MailToComponent,
    CreateFileModalComponent
  ],
  imports: [
    CommonModule,
    IonicModule,
    ReactiveFormsModule,
    CreateFileFormModule
  ],
  exports: [
    MailToComponent
  ],
  providers: [
    MailToService,
    FileSystemService
  ]
})
export class MailToModule { }
