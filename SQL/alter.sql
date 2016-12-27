alter table AEROPUERTO
   add constraint FK_AEROPUER_ESTA_LUGAR foreign key (FK_LUG)
      references LUGAR (LUG_ID)
      on delete restrict on update restrict;

alter table AER_VUE
   add constraint FK_AER_VUE_SALE_VUELO foreign key (AV_FK_VUE)
      references VUELO (VUE_ID)
      on delete restrict on update restrict;

alter table AER_VUE
   add constraint FK_AER_VUE_SALEN_AEROPUER foreign key (AV_FK_AER)
      references AEROPUERTO (AER_ID)
      on delete restrict on update restrict;

alter table LUGAR
   add constraint FK_LUGAR_TIENE_LUGAR foreign key (FK_LUG)
      references LUGAR (LUG_ID)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_ASEGURA_CLIENTE foreign key (FK_CLI)
      references CLIENTE (CLI_CI)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_LO_RESERV_VUELO foreign key (FK_VUE)
      references VUELO (VUE_ID)
      on delete restrict on update restrict;

alter table TARJETA
   add constraint FK_TARJETA_PAGA_CLIENTE foreign key (FK_CLI)
      references CLIENTE (CLI_CI)
      on delete restrict on update restrict;

alter table TARJETA_DE_EMBARQUE
   add constraint FK_TARJETA__ASGINA_CLIENTE foreign key (FK_CLI)
      references CLIENTE (CLI_CI)
      on delete restrict on update restrict;

alter table TARJETA_DE_EMBARQUE
   add constraint FK_TARJETA__ASIGNA_PLAZA foreign key (FK_PLA)
      references PLAZA (PLA_ID)
      on delete restrict on update restrict;

alter table TARJETA_DE_EMBARQUE
   add constraint FK_TARJETA__PERTENECE_VUELO foreign key (FK_VUE)
      references VUELO (VUE_ID)
      on delete restrict on update restrict;

alter table VUELO
   add constraint FK_VUELO_REALIZA_AVION foreign key (FK_AVI)
      references AVION (AVI_ID)
      on delete restrict on update restrict;