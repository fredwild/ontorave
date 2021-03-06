

-- 
-- ontorave_development 
-- 

SET sql_mode='ANSI_QUOTES'; 
SET character_set_client = utf8 ; 

drop database if exists ontorave_development;
create database if not exists ontorave_development;
use ontorave_development;


drop table if exists "items";
create table "items" (
    "id"                int          not null auto_increment,
    "type"              varchar(64),
    "name"              varchar(120),
    "created_at"        datetime,
    "updated_at"        datetime,
    "sort_code"         int,
    "owner_info_node_id" int,
    "body"              mediumtext,
    "value"             varchar(120),
    "view"              mediumtext,
    primary key ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "tags";
create table "tags" (
    "id"                int          not null auto_increment,
    "name"              varchar(120),
    primary key ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


drop table if exists "properties";
create table "properties" (
    "id"                int          not null auto_increment,
    "name"              varchar(120),
    "value"             varchar(120),
    "item_item_id"      int,
    primary key ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;


alter table "items" add constraint "fk_items_owner_info_node_id" foreign key ("owner_info_node_id") references "items" ("id") on delete cascade;
alter table "properties" add constraint "fk_properties_item_item_id" foreign key ("item_item_id") references "items" ("id") on delete cascade;

drop table if exists "info_nodes_ref_targets_items";
create table "info_nodes_ref_targets_items" (
    "info_node_src_id"      int,
    "item_dest_id"    int,
    constraint "fk_info_nodes_ref_targets_items_sid" foreign key ("info_node_src_id") references "items" ("id") on delete cascade,
    constraint "fk_info_nodes_ref_targets_items_did" foreign key ("item_dest_id") references "items" ("id") on delete cascade,
    primary key ("info_node_src_id", "item_dest_id")
);

drop table if exists "tags_items_items";
create table "tags_items_items" (
    "tag_src_id"      int,
    "item_dest_id"    int,
    constraint "fk_tags_items_items_sid" foreign key ("tag_src_id") references "tags" ("id") on delete cascade,
    constraint "fk_tags_items_items_did" foreign key ("item_dest_id") references "items" ("id") on delete cascade,
    primary key ("tag_src_id", "item_dest_id")
);
