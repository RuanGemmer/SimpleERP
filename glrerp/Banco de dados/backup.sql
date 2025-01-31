PGDMP     	    ;                {            erp    15.1    15.1 D    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            O           1262    17091    erp    DATABASE     z   CREATE DATABASE erp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE erp;
                postgres    false            �            1255    17349 "   calcular_estoque_vendaorproducao()    FUNCTION     B  CREATE FUNCTION public.calcular_estoque_vendaorproducao() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.tipo = 'venda' OR NEW.tipo = 'producao' THEN
    UPDATE item
    SET qtde_estoque = item.qtde_estoque + NEW.qtde
    WHERE item.id = NEW.item_id AND item.ativo = true;
  END IF;

  RETURN NEW;
END;
$$;
 9   DROP FUNCTION public.calcular_estoque_vendaorproducao();
       public          postgres    false            �            1255    17347    calcular_valor_estoque()    FUNCTION     �  CREATE FUNCTION public.calcular_valor_estoque() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.tipo = 'compra' THEN
    UPDATE item
    SET valor = (
        (item.qtde_estoque * item.valor + NEW.qtde * NEW.valor)
        / (item.qtde_estoque + NEW.qtde)
      ),
      qtde_estoque = item.qtde_estoque + NEW.qtde
    WHERE item.id = NEW.item_id AND item.ativo = true;
  END IF;

  RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.calcular_valor_estoque();
       public          postgres    false            �            1255    17344    calcular_valor_estrutura()    FUNCTION     H  CREATE FUNCTION public.calcular_valor_estrutura() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE estrutura
  SET valor_estrutura = 
    CASE 
      WHEN estrutura.und_medida = item.unidade_medida THEN item.valor * estrutura.qtde_insumo
      WHEN estrutura.und_medida = item.und_conv1 THEN item.valor * item.conv2 * estrutura.qtde_insumo
      WHEN estrutura.und_medida = item.und_conv2 THEN item.valor / item.conv2 * estrutura.qtde_insumo
    END
  FROM item
  WHERE estrutura.insumo_id = item.id AND estrutura.ativo=true AND item.id = NEW.id;

  RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.calcular_valor_estrutura();
       public          postgres    false            �            1259    17363 
   adicionais    TABLE     �   CREATE TABLE public.adicionais (
    id integer NOT NULL,
    descricao character varying(150) NOT NULL,
    valor numeric(10,2) NOT NULL,
    ativo boolean NOT NULL
);
    DROP TABLE public.adicionais;
       public         heap    postgres    false            �            1259    17362    adicionais_id_seq    SEQUENCE     �   CREATE SEQUENCE public.adicionais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.adicionais_id_seq;
       public          postgres    false    227            P           0    0    adicionais_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.adicionais_id_seq OWNED BY public.adicionais.id;
          public          postgres    false    226            �            1259    17240    cliente    TABLE     M  CREATE TABLE public.cliente (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    cpf character varying(45) NOT NULL,
    email character varying(150) NOT NULL,
    telefone character varying(45) NOT NULL,
    endereco character varying(250),
    tipo character varying(45) NOT NULL,
    ativo boolean NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    17239    cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cliente_id_seq;
       public          postgres    false    215            Q           0    0    cliente_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;
          public          postgres    false    214            �            1259    17275 	   estrutura    TABLE     �   CREATE TABLE public.estrutura (
    item_id integer NOT NULL,
    insumo_id integer NOT NULL,
    qtde_insumo double precision NOT NULL,
    ativo boolean NOT NULL,
    und_medida character varying(45) NOT NULL,
    valor_estrutura numeric(10,2)
);
    DROP TABLE public.estrutura;
       public         heap    postgres    false            �            1259    17256    grupo    TABLE     �   CREATE TABLE public.grupo (
    id integer NOT NULL,
    descricao character varying(100) NOT NULL,
    tipo character varying(45) NOT NULL,
    ativo boolean NOT NULL
);
    DROP TABLE public.grupo;
       public         heap    postgres    false            �            1259    17255    grupo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grupo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.grupo_id_seq;
       public          postgres    false    219            R           0    0    grupo_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.grupo_id_seq OWNED BY public.grupo.id;
          public          postgres    false    218            �            1259    17263    item    TABLE     �  CREATE TABLE public.item (
    id integer NOT NULL,
    id_grupo integer NOT NULL,
    descricao character varying(150) NOT NULL,
    qtde_estoque double precision NOT NULL,
    ativo boolean NOT NULL,
    unidade_medida character varying(45) NOT NULL,
    observacao text,
    conv1 double precision,
    und_conv1 character varying(45),
    conv2 double precision,
    und_conv2 character varying(45),
    valor numeric(10,2) NOT NULL,
    qtde_estoque_min double precision
);
    DROP TABLE public.item;
       public         heap    postgres    false            �            1259    17262    item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.item_id_seq;
       public          postgres    false    221            S           0    0    item_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;
          public          postgres    false    220            �            1259    17292    movimentacao    TABLE     �  CREATE TABLE public.movimentacao (
    id integer NOT NULL,
    tipo character varying(45) NOT NULL,
    data timestamp without time zone NOT NULL,
    item_id integer NOT NULL,
    cliente_id integer,
    valor numeric(10,2) NOT NULL,
    qtde double precision NOT NULL,
    perda double precision NOT NULL,
    observacao character varying(500),
    id_pedido integer,
    id_grupo_movimentacao integer NOT NULL
);
     DROP TABLE public.movimentacao;
       public         heap    postgres    false            �            1259    17369    movimentacao_adicionais    TABLE     �   CREATE TABLE public.movimentacao_adicionais (
    movimentacao_id integer NOT NULL,
    adicionais_id integer NOT NULL,
    qtde double precision NOT NULL,
    valor numeric(10,2) NOT NULL,
    observacao character varying(500)
);
 +   DROP TABLE public.movimentacao_adicionais;
       public         heap    postgres    false            �            1259    17291    movimentacao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movimentacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movimentacao_id_seq;
       public          postgres    false    224            T           0    0    movimentacao_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movimentacao_id_seq OWNED BY public.movimentacao.id;
          public          postgres    false    223            �            1259    17310    movimentacao_usuario    TABLE     t   CREATE TABLE public.movimentacao_usuario (
    movimentacao_id integer NOT NULL,
    usuario_id integer NOT NULL
);
 (   DROP TABLE public.movimentacao_usuario;
       public         heap    postgres    false            �            1259    17249    usuario    TABLE       CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(150) NOT NULL,
    senha character varying(150) NOT NULL,
    hierarquia character varying(45) NOT NULL,
    ativo boolean NOT NULL,
    email character varying(150) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    17248    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    217            U           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    216            �           2604    17366    adicionais id    DEFAULT     n   ALTER TABLE ONLY public.adicionais ALTER COLUMN id SET DEFAULT nextval('public.adicionais_id_seq'::regclass);
 <   ALTER TABLE public.adicionais ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    17243 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    17259    grupo id    DEFAULT     d   ALTER TABLE ONLY public.grupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_id_seq'::regclass);
 7   ALTER TABLE public.grupo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    17266    item id    DEFAULT     b   ALTER TABLE ONLY public.item ALTER COLUMN id SET DEFAULT nextval('public.item_id_seq'::regclass);
 6   ALTER TABLE public.item ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    17295    movimentacao id    DEFAULT     r   ALTER TABLE ONLY public.movimentacao ALTER COLUMN id SET DEFAULT nextval('public.movimentacao_id_seq'::regclass);
 >   ALTER TABLE public.movimentacao ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    17252 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            H          0    17363 
   adicionais 
   TABLE DATA           A   COPY public.adicionais (id, descricao, valor, ativo) FROM stdin;
    public          postgres    false    227   V       <          0    17240    cliente 
   TABLE DATA           X   COPY public.cliente (id, nome, cpf, email, telefone, endereco, tipo, ativo) FROM stdin;
    public          postgres    false    215   VV       C          0    17275 	   estrutura 
   TABLE DATA           h   COPY public.estrutura (item_id, insumo_id, qtde_insumo, ativo, und_medida, valor_estrutura) FROM stdin;
    public          postgres    false    222   �X       @          0    17256    grupo 
   TABLE DATA           ;   COPY public.grupo (id, descricao, tipo, ativo) FROM stdin;
    public          postgres    false    219   vY       B          0    17263    item 
   TABLE DATA           �   COPY public.item (id, id_grupo, descricao, qtde_estoque, ativo, unidade_medida, observacao, conv1, und_conv1, conv2, und_conv2, valor, qtde_estoque_min) FROM stdin;
    public          postgres    false    221   �Y       E          0    17292    movimentacao 
   TABLE DATA           �   COPY public.movimentacao (id, tipo, data, item_id, cliente_id, valor, qtde, perda, observacao, id_pedido, id_grupo_movimentacao) FROM stdin;
    public          postgres    false    224   h[       I          0    17369    movimentacao_adicionais 
   TABLE DATA           j   COPY public.movimentacao_adicionais (movimentacao_id, adicionais_id, qtde, valor, observacao) FROM stdin;
    public          postgres    false    228   7`       F          0    17310    movimentacao_usuario 
   TABLE DATA           K   COPY public.movimentacao_usuario (movimentacao_id, usuario_id) FROM stdin;
    public          postgres    false    225   }`       >          0    17249    usuario 
   TABLE DATA           L   COPY public.usuario (id, nome, senha, hierarquia, ativo, email) FROM stdin;
    public          postgres    false    217   �`       V           0    0    adicionais_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.adicionais_id_seq', 3, true);
          public          postgres    false    226            W           0    0    cliente_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cliente_id_seq', 10, true);
          public          postgres    false    214            X           0    0    grupo_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.grupo_id_seq', 5, true);
          public          postgres    false    218            Y           0    0    item_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.item_id_seq', 25, true);
          public          postgres    false    220            Z           0    0    movimentacao_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.movimentacao_id_seq', 125, true);
          public          postgres    false    223            [           0    0    usuario_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuario_id_seq', 22, true);
          public          postgres    false    216            �           2606    17368    adicionais adicionais_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.adicionais
    ADD CONSTRAINT adicionais_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.adicionais DROP CONSTRAINT adicionais_pkey;
       public            postgres    false    227            �           2606    17247    cliente cliente_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    215            �           2606    17261    grupo grupo_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_pkey;
       public            postgres    false    219            �           2606    17268    item item_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.item DROP CONSTRAINT item_pkey;
       public            postgres    false    221            �           2606    17299    movimentacao movimentacao_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.movimentacao DROP CONSTRAINT movimentacao_pkey;
       public            postgres    false    224            �           2606    17314 .   movimentacao_usuario movimentacao_usuario_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.movimentacao_usuario
    ADD CONSTRAINT movimentacao_usuario_pkey PRIMARY KEY (movimentacao_id);
 X   ALTER TABLE ONLY public.movimentacao_usuario DROP CONSTRAINT movimentacao_usuario_pkey;
       public            postgres    false    225            �           2606    17254    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    217            �           2620    17348 $   movimentacao atualizar_valor_estoque    TRIGGER     �   CREATE TRIGGER atualizar_valor_estoque AFTER INSERT ON public.movimentacao FOR EACH ROW EXECUTE FUNCTION public.calcular_valor_estoque();
 =   DROP TRIGGER atualizar_valor_estoque ON public.movimentacao;
       public          postgres    false    230    224            �           2620    17346    item atualizar_valor_estrutura    TRIGGER     �   CREATE TRIGGER atualizar_valor_estrutura AFTER UPDATE ON public.item FOR EACH ROW EXECUTE FUNCTION public.calcular_valor_estrutura();
 7   DROP TRIGGER atualizar_valor_estrutura ON public.item;
       public          postgres    false    229    221            �           2620    17350 -   movimentacao calcular_estoque_vendaorproducao    TRIGGER     �   CREATE TRIGGER calcular_estoque_vendaorproducao AFTER INSERT ON public.movimentacao FOR EACH ROW EXECUTE FUNCTION public.calcular_estoque_vendaorproducao();
 F   DROP TRIGGER calcular_estoque_vendaorproducao ON public.movimentacao;
       public          postgres    false    231    224            �           2606    17381 (   movimentacao_adicionais fk_adicionais_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimentacao_adicionais
    ADD CONSTRAINT fk_adicionais_id FOREIGN KEY (adicionais_id) REFERENCES public.adicionais(id);
 R   ALTER TABLE ONLY public.movimentacao_adicionais DROP CONSTRAINT fk_adicionais_id;
       public          postgres    false    227    228    3232            �           2606    17305    movimentacao fk_cliente_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id);
 D   ALTER TABLE ONLY public.movimentacao DROP CONSTRAINT fk_cliente_id;
       public          postgres    false    3220    224    215            �           2606    17269    item fk_id_grupo    FK CONSTRAINT     p   ALTER TABLE ONLY public.item
    ADD CONSTRAINT fk_id_grupo FOREIGN KEY (id_grupo) REFERENCES public.grupo(id);
 :   ALTER TABLE ONLY public.item DROP CONSTRAINT fk_id_grupo;
       public          postgres    false    221    3224    219            �           2606    17286    estrutura fk_insumo_id    FK CONSTRAINT     v   ALTER TABLE ONLY public.estrutura
    ADD CONSTRAINT fk_insumo_id FOREIGN KEY (insumo_id) REFERENCES public.item(id);
 @   ALTER TABLE ONLY public.estrutura DROP CONSTRAINT fk_insumo_id;
       public          postgres    false    222    221    3226            �           2606    17281    estrutura fk_item_id    FK CONSTRAINT     r   ALTER TABLE ONLY public.estrutura
    ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES public.item(id);
 >   ALTER TABLE ONLY public.estrutura DROP CONSTRAINT fk_item_id;
       public          postgres    false    3226    222    221            �           2606    17300    movimentacao fk_item_id    FK CONSTRAINT     u   ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES public.item(id);
 A   ALTER TABLE ONLY public.movimentacao DROP CONSTRAINT fk_item_id;
       public          postgres    false    221    224    3226            �           2606    17315 '   movimentacao_usuario fk_movimentacao_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimentacao_usuario
    ADD CONSTRAINT fk_movimentacao_id FOREIGN KEY (movimentacao_id) REFERENCES public.movimentacao(id);
 Q   ALTER TABLE ONLY public.movimentacao_usuario DROP CONSTRAINT fk_movimentacao_id;
       public          postgres    false    224    225    3228            �           2606    17376 *   movimentacao_adicionais fk_movimentacao_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimentacao_adicionais
    ADD CONSTRAINT fk_movimentacao_id FOREIGN KEY (movimentacao_id) REFERENCES public.movimentacao(id);
 T   ALTER TABLE ONLY public.movimentacao_adicionais DROP CONSTRAINT fk_movimentacao_id;
       public          postgres    false    224    3228    228            �           2606    17320 "   movimentacao_usuario fk_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.movimentacao_usuario
    ADD CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 L   ALTER TABLE ONLY public.movimentacao_usuario DROP CONSTRAINT fk_usuario_id;
       public          postgres    false    217    225    3222            H   6   x�3�t�rqt�W0U����4�30�,�2��� �	�C��=... ��	      <   D  x�u��N�0��ӧ�c'���0�KS�18Mh/��RT)���m���(��Nv���+�l�7�L̚���H��>U��Nph��7Us��-�U� 1�b!��9�'J����1ɪ���i�}�����k��0sƑ�-��#.���6��mN 3>-
C�4[���+Z(ʴ�2a�bp�9�_�n7������O$Q(|"p�»��GjEr�t�c)�s0����O 	s�&'7�~�:rf�w�) 	)S1M�:f�� f�u'U��v=z��+\r�<�ɅYZo�su۴�zU�4-�r87�>���ܧ�%2�֧�) $�RQ�X�4���vSo�$���b���.	��9s��w23���L��4��1	�JH���͖�X�ZQ�hb��z]��v=D���� �Xǻk"����˷%�;�st��FZP-��!l��栵b`��67g���Z�p�]\�&K�tL0��T23���c&ag '��^���W�$�TrICd5��j���z �c�)�E/Qt����;Ţ��8�Zfb3G�f2E"r��c	�BF���	`���mC���o 욠��5�w����h��g �      C   �   x�}�A�0��+x�e�q����B@�O��Vj���;�� L0��p�N���0��)p��"�ԁ|#��D�Ǆ
j�Ht��Ut?#��.��m�N�����!3"T-���ڼ��YM����"��ڣ�ղ�y�G�q�b��
IyZUE��K�C�`٘��4�B�u`����s�nj�      @   n   x�e�1�0F���)r)p 7��r��k�*!��p�^������E�����i�h���A٥�L�(��.�d1ޒ����4q��Z��'9����n.���ٯ+���      B   d  x�mQKN�0]�O�%,�<���K7"RGI�u�����+�=G�H��8�?��-���H�6�</��JX��j��%�����|�zg�P�4�AA�Uh�2p�z�UC��Jh����Є[Y(";NJ����$�K��P
� �R`�SL^���qJH	��~���a>
����%Sr�J�O%	d��w ~m~��^I��r~�:�{�g��$� ]=���ة�َL7A�@@��d�xi�*)�h����<,`U�k��>�������~�@	jC�htCWm�]��qͯ'�+��S[VI� �]�u�N-N+���Bʗ&�M�ޱ-�CVo�k>
%}Pwĩ`��2���      E   �  x���M��(���}����1|��d�Jf�t*S���d#y��EWW=�xy�i߾}�������K﮼� ��� ni�~ns��bR�~�������B�}�k��f��AygR�D?���C� +��RJ��� �{�Z�V0ڙ{�g��l��nB��
�T3^Ō�޽Ay�bB[!�i��,��7�/�'Rs�� L~$��m�IF�P����� ���o~�b���$�@����r0�ܵJ�_����J�����P���|�	�6p���pV��2"��_���+�2V�H�PP׀��Bi���vC;�A�³�l�
K&�P��H�|�L�Pz��z'��r�y9��]{�ؚ�y��4�RT1�E�
I�
ݹ��T��D�=���z/�mg���$y�-�{OjP2�ޮ�uu��� &>T�$G�m�^�(BF���3Ǖ}ё�̤���Rᙚե��g&�s?�O�Eq�m���d�.f�С8K/������0�9L�����m�΁����4I2A~'Ӵ٭�l�A�\��C��%_1�$Wql�]���ijd�\�9vV�욫2hq�(�Ȯ�*�&�j~A�5W<��M�|�L�����\��~B�G0��S��)j&��I�dT� 3I�{���ydB�E�<�*�<�(&�yd�-Q��ǵw6�_�l�����(Mq�9�"5��<sbkSLP�<sBS��(���1�{��Ǉ(�3�43�f�U
`R$�$�i2�I%�`v���3ES"F�|�a� "W'MN��Q�z��	&�>;8��Ȟ�&��>R�yz��Ց2Z�ԙ2k��N�Y�u�̊0����1�|V�xS)�1�0poX�̭:f��:�.L��꘻0L̵_/u��E�[�&�G"ss�}�Pq_�'tt���#TA���C�4�/3�]��%�d"��cO'�)��v0��Ao�j7E6A��Si�k�#��NF~���.��dWL�J�-�*�I���)2L�;du�k����A�� �������A��x��X�` �y85{��L>#tQ��n+��F�ԧ�aV�\¬�Vhu�%
�G�B��VHh�4ux��(�:�i�qV�(��W�h���X���Q�+U�/�1Z���ep����W��mx�"�gDa� �d��	�@�C�A�c�l��&[HH;`-�� A�� �A�@|��y�2�Xc�F�      I   6   x�342�4�4�44�30�t�/JIL�Wp+J�+IUp-N��ITpr��b���� (��      F   Q   x�%̹�0���,ƣ;����ס1� ��x��Y]�]=���֘�Yg�M��f��E(B�P�"�E(F1�Q�b��q��!?      >     x�]��r�0�ux�.XG����D�%U	02�M��H%D������v}Ϝ�\��t�
��7L�2���ȏ+Z����.����iB�sʻz`�خ�g�{<É_��b�*����8���LR��x�
���ᶑ������C�-�9��ߔ,N/g|���0�m�gE7�W�Yj{��i��AHB���h=N۔��8!������UE:Kx��̴�3�8L�J�e��;c�t�d0�E'�	�wH�Y~���;1
��(I���l�     