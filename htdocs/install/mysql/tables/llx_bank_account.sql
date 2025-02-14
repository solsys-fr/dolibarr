-- =============================================================================
-- Copyright (C) 2000-2004  Rodolphe Quiedeville    <rodolphe@quiedeville.org>
-- Copyright (C) 2004-2014  Laurent Destailleur     <eldy@users.sourceforge.net>
-- Copyright (C) 2005-2012  Regis Houssin           <regis.houssin@inodbox.com>
-- Copyright (C) 2014-2023  Alexandre Spangaro      <aspangaro@easya.solutions>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <https://www.gnu.org/licenses/>.
--
-- =============================================================================

-- courant : type of account: 0 epargne, 1 curent/card/cheque, 2 cash
-- clos : is account opened or closed

create table llx_bank_account
(
  rowid						integer AUTO_INCREMENT PRIMARY KEY,
  datec						datetime,
  tms						timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  ref						varchar(12) NOT NULL,
  label						varchar(50) NOT NULL,
  entity					integer DEFAULT 1 NOT NULL, -- multi company id
  fk_user_author			integer,
  fk_user_modif				integer,
  bank						varchar(60),
  code_banque				varchar(128),
  code_guichet				varchar(6),
  number					varchar(255),
  cle_rib					varchar(5),
  bic						varchar(11),                -- 11 according to ISO 9362
  bic_intermediate          varchar(11),                -- 11 according to ISO 9362. Same as bic but for intermediate bank
  iban_prefix				varchar(80),				-- full iban. 34 according to ISO 13616 but we set 80 to allow to store it with encryption information
  country_iban				varchar(2),					-- deprecated
  cle_iban					varchar(2),
  domiciliation				varchar(255),
  pti_in_ctti               smallint DEFAULT 0,
  state_id					integer        DEFAULT NULL,
  fk_pays					integer        NOT NULL,
  proprio					varchar(60),
  owner_address				varchar(255),
  owner_zip					varchar(25),
  owner_town				varchar(50),
  owner_country_id			integer DEFAULT NULL,
  courant					smallint DEFAULT 0 NOT NULL,
  clos						smallint DEFAULT 0 NOT NULL,
  rappro					smallint DEFAULT 1,
  url						varchar(128),
  account_number			varchar(32),				-- bank accountancy number
  fk_accountancy_journal	integer,					-- bank accountancy journal
  currency_code				varchar(3) NOT NULL,
  min_allowed				integer DEFAULT 0,
  min_desired				integer DEFAULT 0,
  comment					text,						-- TODO rename in note_private
  note_public				text,
  model_pdf					varchar(255),
  import_key				varchar(14),
  extraparams			    varchar(255),				-- for other parameters with json format
  ics						varchar(32),                -- Creditor Identifier CI
  ics_transfer              varchar(32)                 -- Creditor Identifier CI for transfer
)ENGINE=innodb;
