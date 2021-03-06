
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

use ontorave_development ;

--
-- Remove constraints
--

ALTER TABLE `properties` DROP FOREIGN KEY `fk_properties_item_item_id` ;
ALTER TABLE `tags_items_items` DROP FOREIGN KEY `fk_tags_items_items_did` ;
ALTER TABLE `tags_items_items` DROP FOREIGN KEY `fk_tags_items_items_sid` ;
ALTER TABLE `items` DROP FOREIGN KEY `fk_items_owner_info_node_id` ;
ALTER TABLE `info_nodes_ref_targets_items` DROP FOREIGN KEY `fk_info_nodes_ref_targets_items_sid` ;
ALTER TABLE `info_nodes_ref_targets_items` DROP FOREIGN KEY `fk_info_nodes_ref_targets_items_did` ;

--
-- Process renaming and type migrations
--


--
-- Drops and adds of tables and columns
--





--
-- Apply constraints
--

ALTER TABLE `properties` ADD CONSTRAINT `fk_properties_item_item_id` FOREIGN KEY (`item_item_id`) REFERENCES `items` (`id`) on delete cascade ;
ALTER TABLE `tags_items_items` ADD CONSTRAINT `fk_tags_items_items_did` FOREIGN KEY (`item_dest_id`) REFERENCES `items` (`id`) on delete cascade ;
ALTER TABLE `tags_items_items` ADD CONSTRAINT `fk_tags_items_items_sid` FOREIGN KEY (`tag_src_id`) REFERENCES `tags` (`id`) on delete cascade ;
ALTER TABLE `items` ADD CONSTRAINT `fk_items_owner_info_node_id` FOREIGN KEY (`owner_info_node_id`) REFERENCES `items` (`id`) on delete cascade ;
ALTER TABLE `info_nodes_ref_targets_items` ADD CONSTRAINT `fk_info_nodes_ref_targets_items_sid` FOREIGN KEY (`info_node_src_id`) REFERENCES `items` (`id`) on delete cascade ;
ALTER TABLE `info_nodes_ref_targets_items` ADD CONSTRAINT `fk_info_nodes_ref_targets_items_did` FOREIGN KEY (`item_dest_id`) REFERENCES `items` (`id`) on delete cascade ;

--
-- end of migration
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

