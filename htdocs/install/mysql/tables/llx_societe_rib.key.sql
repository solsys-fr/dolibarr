-- ===================================================================
-- Copyright (C) 2016		Laurent Destailleur	<eldy@users.sourceforge.net>
-- Copyright (C) 2024		Regis Houssin		<regis.houssin@inodbox.com>
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
-- ===================================================================


ALTER TABLE llx_societe_rib ADD UNIQUE INDEX uk_societe_rib(entity, label, fk_soc);

ALTER TABLE llx_societe_rib ADD CONSTRAINT llx_societe_rib_fk_societe FOREIGN KEY (fk_soc) REFERENCES llx_societe(rowid);
