-- Migrations will appear here as you chat with AI

create table usuarios (
  id bigint primary key generated always as identity,
  nombre text not null,
  correo text unique not null,
  fecha_registro timestamptz default now()
);

create table publicaciones (
  id bigint primary key generated always as identity,
  usuario_id bigint references usuarios (id),
  contenido text not null,
  fecha_publicacion timestamptz default now()
);

create table amistades (
  id bigint primary key generated always as identity,
  usuario_id1 bigint references usuarios (id),
  usuario_id2 bigint references usuarios (id),
  fecha_amistad timestamptz default now(),
  unique (usuario_id1, usuario_id2)
);

create table comentarios (
  id bigint primary key generated always as identity,
  publicacion_id bigint references publicaciones (id),
  usuario_id bigint references usuarios (id),
  contenido text not null,
  fecha_comentario timestamptz default now()
);

create table reacciones (
  id bigint primary key generated always as identity,
  publicacion_id bigint references publicaciones (id),
  usuario_id bigint references usuarios (id),
  tipo_reaccion text not null,
  fecha_reaccion timestamptz default now()
);