
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/11/2019 6:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 12/11/2019 6:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Autor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Biblioteca]    Script Date: 12/11/2019 6:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Biblioteca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[LibroId] [int] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Biblioteca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 12/11/2019 6:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LibroId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Texto] [nvarchar](max) NULL,
	[Puntaje] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
 CONSTRAINT [PK_dbo.Comentario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Libro]    Script Date: 12/11/2019 6:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Imagen] [nvarchar](max) NULL,
	[AutorId] [int] NOT NULL,
	[Puntaje] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Libro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/11/2019 6:53:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Nombres] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912112252119_initial', N'BibliotecaUPN.Web.Migrations.Configuration', 0x1F8B0800000000000400ED5CDB6EDC36107D2FD07F10F4D416CECA4E5E52633781B3B60BA3BEC16BA77D0BB81277AD56A2549172D728FA657DE827F5174A69298AE24597D5DE1C187971287266383CC31992C7FEEF9F7F871F1761603DC104FB111AD9478343DB82C88D3C1FCD47764A666FDEDB1F3F7CFBCDF0CC0B17D6E7A2DFBBAC1F1D89F0C87E24243E761CEC3EC210E041E8BB4984A31919B851E8002F72DE1E1EFEE81C1D39908AB0A92CCB1ADEA588F821CCFF43FF3B8E900B639282E02AF26080593BFD32C9A55AD7208438062E1CD99FFC69E04704BAE0E1F67AF00B9C0E4E3FD9D649E0036ACB040633DB02084504106AE9F10386139244683E89690308EE9F6348FBCD4080219BC171D9BDED640EDF669371CA81852837C5240A3B0A3C7AC7BCE3C8C357F2B1CDBD47FD7746FD4C9EB359E73E1CD927298912DB92351D8F8324EBA5F3EF724D06F9C8034BF97EC06141D193FD3BB0C66940D2048E104C49028203EB36A583DC9FE1F37DF43B4423940681682635947EAB34D0A6DB248A61429EEFE08C197FE1D996531DE7C803F93061CC72661788BC7B6B5BD75439980690A340F0C2844E11FE04114C0081DE2D200426289301733F2ADA255DD751384D206E52280A193AE512D52E5CE9F79556AFFCF0BA8475BA1E700A123F6A56592FE6D29F26BD859C614263BBA38C6BF0E4CF7357E84CB2AD3B18E45FF1A31F2F374C011B5F58A7F3240AEFA2A002A8E5B72F93284D5CAAF63E3274B807C91C92F676318F3759C6BB696D635FEBAC2BBAE8EC6B1D85CC3F2B04603EF235F69AB7CF421FCDDBB408B1AD2BB0B884684E1E4736FD91AEBFBF805ED1C26C78403EAD59E82092A48D6175118239441B5793E7CBBE5BC02D2D94C06FDC27A7114502ECB109B0F4AF09B565F0B2EF658C09CD4A7089DFBA46FD380A2928B280C435E6547AC946091F0DA6893D7A857D2968A5D82F87BF6E001BCF9A6BCAE0F77041A28D6F12527CF7CDF175B9B404A12E97AA5F9598D274E91554DC8A15228A8D7D0DA7FA48A0DDE94F9B4731C0F8CF28F136AE483A60AD498F09B1271847AE9F2F85B841B1245935F40C79564DC65C9ACB131B359962D28F290AA9DE91FD833271BDBC22DE04792C6357E51DD9327A6FD0290C2081D689BBBC981803EC024FF538F585576DA18087498638108CE98E4243C847448D0E1FB97E0C02B3D5D29096219599C485CB5F4E610C51160D66DFB7D1CA4B355535D72079A9C9294347404F3DA8341BB3090B75BB740909B15A698FB39AED5D90CD37ED7D039CD9FC2DE0CEBC2E6D940B15CB4E00A8D6DAF57B91B6F06ED8E1D60A903A833498ED120F3D363B8D5BB6B6E5693CD046372FB877823BE5DEC9B4CAE64BA87291C5FBD1F69B9EF1F66AAB785E097426D3B78039D37ABC28C835E5DABADBC535C2EE25E65AB3F9DB05DFDEE7DAE5B9828E2174044C8A72338EB326B8209AB32F3DB4B1E32F666715194499C8092462ED9A1D89CA334CF564A080B03ABE74A74E8608EF06417960EB64B0FDB36178E5AA4F9121A6F006416C8575527840492284D593E6535C880A3D34F7A53290EA0F83DCE0D2670A14EB8F7F8204BEFC72A457E7D462BEBAFB2175DA4D8795B6C715610A9595AFF144CD014590562E7F6F8F68EEA04D383016CF2DCBE75530A1AB7ADBB975055FA86F84AA2BEAEBB976159D3081CACE54E30D630DD7E8D47E7EA88992A632A36DA1D1CF1BEB8D92E2968C6733FE6DE82C693AAC61E818F83CC32B10C73E9A0BFC1ED6624D96E49EF19B4977CE4BB894E1B858437DE1D6724D74BF0473287DCDC2C583E77E82C92920600AB22BC3B1172ADD84DC6D484385A26A7A5617ACC84D45FFEC67196325C569A0CD34A507CFE9A4B278CFE707E504A18EB3326E150840A2B99F1E47411A2273B1661ECDEF674511BC5195337424F395924CF19352D056DDDE6A51C458EABD304289D47D75EA066F6689840258145253179B65F1B39C28C978C033CB29882EA298A26D6F40C352486FBC6853630BA818C66D32907571DC454AC1B4A8D8C1DADA4BE1B7F3A218E395BD590E7F6B15E5F0C6BDC1597D29D9116CC2B9A93BE2EA066F0676EBDA50D6B9C93122802887357D75D0E355616FDC19AADE16A0338EDC543A2CDEC8AB40295A3BAC317F04AF2C326F7DA1559452F6CB5DB8765EFE4B65FE9095DCCDDC7EA5065F76B12DEAA027DFCBEAEFC93326301C641D06933F8271E0D3F9961DAE00F267109325B1C3A64784F7D22F07EC0F51DFC1D80B34471685AD5F5DAC2D5053FCCCA58DE4938E842A89BB91EB583B35FEEB70954261CBB52857C517C8838B91FD573EEAD8BAF8F50B1F7860DD24341C8EAD43EBEFBEE4F5B6CAD9B05EAAAB94F7356244F7C0F852E151E549A32790B88F20F92E048BEF4559DDB9D0BD44497CE7B6A861C37AA1466251CE8208AC0D38A622F8C5A26787D1BDE37DAD42E9ED857509706BDCA7F4AFD22F156B3203B59FD32596692F615235D241D67AD9A2EC7D71AB844EE92169157AEA4AB401D315F66638515F17F3933F366D991FA27B7EDD2EB9CE7C95B0411AE71E72497AF3367746D2DC1572DA6F03DBC5CDDE50E0EA5997BB058DC83C5A916FB7DFA0A97D37DC63D0EC7FA6DA1574B698A93A82671F588F2AC1425E3F0DB1D14C6B5C5E0D8F6C6F9A416D59AC77653C36101E752ABA1222CD7C489DF4AE54C906A6A44E457726651D9152A761FB2CCB0A5404D64B23874EE588ED2791525A89CA43593BCAA4811AB8B72CC9E695D9FA44D74C815C659AEAD625B388F692E1B82A7CD739DD0EF445F5BD922643E12F96D16C8CFD792922FBFB6508BA9534C8FB5CA059542464C9A2A28B7435750509F0688E3C49883F032EA19F5D8871FE9BCE9F419066CF24E1147A17E82625714AE89461380D2ABF0E9E65F53AFD3947B36AF3F026CEFF62C03AA640CDF4E914E00DFA94FA81C7ED3ED7DC8C1A4464E502BB89CCD692643792F3672EE93A422D0531F7F12AE71E86714085E11B34014F7015DB1E30BC8473E03E17CFCE6621CD0B5175FBF0D407F3048498C928C7D3FF520C7BE1E2C3FF82CB6E30B84F0000, N'6.1.3-40302')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912112258287_Migration', N'BibliotecaUPN.Web.Migrations.Configuration', 0x1F8B0800000000000400ED5CDB6EE336107D2FD07F10F4D416592BC9BEB481BD45D6498AA09B0BE264DBB7052DD18E5A8952452A7550F4CBFAD04FEA2F9492298AE24517CBB704C1BE6479190E67CE7086D449FEFBE7DFE18F8B30B09E6082FD088DECA3C1A16D41E4469E8FE6233B25B377DFDB3F7EF8FAABE1B9172EACCFC5B8F7D9383A13E191FD48487CE238D87D8421C083D077930847333270A3D0015EE41C1F1EFEE01C1D39908AB0A92CCB1ADEA588F821CCFF43FF3B8E900B639282E02AF26080593BED99E452AD6B10421C03178EEC8FFE34F023025DF0707B3DF8054E07671F6DEB34F001D5650283996D0184220208D5F4E401C3094922349FC4B40104F7CF31A4E36620C090EDE0A41CDE763387C7D9669C726221CA4D3189C28E028FDE33EB38F2F4956C6C73EB51FB9D533B93E76CD7B90D47F6694AA2C4B6E4954EC641928DD2D977E993413EF3C052FA0F382C287AB27F07D6380D489AC011822949407060DDA67492FB337CBE8F7E876884D22010D5A48AD2BE4A036DBA4DA21826E4F90ECE98F2979E6D39D5798E3C914F13E62C777689C8FB63DBBAA68B836900390A042B4CE816E14F10C10410E8DD02426082321930B7A3B2BAB4D675144E13888B0529F26818D9D615587C82684E1E4736FDD1B62EFC05F48A16A6C403F269D4D149244961759DA1537AB1D6B7A56B567270D9F1E6E5BAB51E700A123F6A5EB25ECC277F9AF416728E090DFF8E32AEC1933FCF4DA153C9B6EE6090F7E2473F5E9EA90236BEB041174914DE45410550CBBE2F93284D5CBAEC7D6418700F923924EDF562166FD28C0FD3EAC67AEBB42B86E8F46B1D85CC3E2B04603EF32DF69A4FD8351FB09A2D85600ED1C697C9536ADF23E096D652E0376E93B3882201F638045885A009B565F0B2FE32C6846625B8C4BEAE513F8E420A8A2C20718D3A9551B25242A741357144AFB02F05AD14FBE5F4B70360E359734D19FC1E2E48B4F143428AEFBE39BE2E979620D4E552B5578929CD905E41C5B55821A2D8DCB770AA8F043A9CFEB47914038CFF8C126FE30B6DF70E768A71E4FAB92BC4038A25C9AAA2E7C8B36A32E6525D9ED8A8CA14937E4C5148D71DD9DF291BD7CB2BE24D90C7327655DE912DA3F7069DC10012689DBACBB78B31C02EF0548B535B78D5160A7898648803C1989E2834847C44D4E8F091EBC720306B2D4D691952994A5CB8DC73066388B26830DBBECDAABC545397E62B48566A32CAD011D0530F2ACDC16CC242DD295D4242AC56DAE3ACE6781764F3437BDF0067567F0BB833FBA5CDE242C5B21300AAB576FD59A42DBC1B4EB8B502A44E210D66BBC4438FC34E6396AD1D791A0BB4599B17DC3BC19DF2EE64F2B2F911AA74B2F83EDAFED033BE5E6D15CF2B81CEA4FA163067F2C78B825C53AEAD7B5D5C23EC5E62AE35ABBF5DF0ED7DAE5DDE2BE81C4267C0A42837E3386B820BA2B9FBD24B1BBBFE627657914194899C4022D6AED995A8BCC3546F060A08ABF34B73EA6488F06E109407B64E063B3F1BA6579EFA1419620A6F10C43CAC93C2034A1221784FDA4FF1202A8CD0BC97CA40AABF0C72854B9B2950ACBFFE0912B8FBE548AFEEA9C57E75EF43EAB69B2E2B6DAF2BC2162A9EAFB144CD05459056BABFB745346FD0261C188BE796E5F32A98D055BDEDCCBA822DD46F84AA29EAEBB976159DB081CAC954630D630DD768D47E76A88992A632A36DA1D1CF1AEB8D92E2958C6733DE3774964C1ED630740C949FE11588631FCD050A106BB1264BFECFF8DDA43B2D265CCA705CAC61C7706DF94AF4BC047328F566E1E2C10B3FC1E40C103005D993E1D80B956142EE36A4A162A16A7A561D56E4A6627CF6B38CB1920535D0669AD28217745359BCE7FB83728250E75919FD0A0420D1BC4F8FA3200D91B95833CFE6EFB3A208DEA8CA193A92FA4A49A6D8492968AB666FE51431967A3B462891BA7BA76EF2665C2414C0A2909ABAD82C8BDFE54449C60B9E594E417411C5146D7B031A96427AE3459B1A5B40C5306F9381AC8BE32E520AA645450FD6D65E0A7F9D17C5189FECCD72F8B756510E6FDC1B9CD597921DC126DC9BBA23AE6EF26660B7AE03659D871C2302887258D3AB831EAF0A7BE3CE50F5B6009D71E6A6D261F18DBC0A94A2B5838FF947F08A9379EB0BADA294B25F1EC257E7E5BF54E60F59C9DD4CFF576AF0E510DBA2067AF2BDACFE9E3C6302C341366030F92318073EDD6F39E00A207F063159123BECE3C3A363E9F707F687CBEF60EC059A2B8B42E8AF3A6B0BD4143F336923F9A423A14AE26EA02790B88F20F926048B6F4561EBE1C8BF0E9B295CB67C15E5CDF812797031B2FFCA679D5897BF7EE1130FAC9B84C6C5897568FDDD97C5DE767136ADD7D255EE7BBE72AD848E0CEED7018F2A61BA43446934AD90A27B899288CF6D51C3A6F5428D44A79C0511581B704CD5F08B45CF0EA37BC7E75A85DBDB0BEB12E0D6784EE93F4FBF54ACC954D47E4697E8A6BD84ADBF2C598D36CA3E346E95D9297D515A85A7BA127FC0F496BD1972D4EBA280F2AF4E5B268AE8BEC36E9765677E53D8209F730F4925BD099C3B636BEE0A39ED8F81EDE2666FB870F5F4CBDD8246A420AD48BCDB6FD0D47E40DC63D0EC7FA6DA1574B698A93A82671FE88F2AD342F69F86E168E6372EDF8847B637CDA0B62CD6BB521F1B988FBA25BA3223CDC4489DF4AE9CC906CAA46E89EE94CA3A46A56E85EDD32D2B5011E82F8D643A952CB69F8C4AC913952F66EDB893068EE0DED2259B3DB3F58DAE990BB9CA36D5A34BA613ED25D57155F8AE73BB1D788CEA874B9A0C85BF6E46B331F6E7A588EC6F9D21E856D2201F738966519190258D8A21D2D3D41524C0A339F23421FE0CB88476BB10E3FC579E3F8320CD3E938453E85DA29B94C429A15B86E134A8FC5E7896D5EBD6CFC99A559D873771FEA703D6B105AAA64FB7006FD0C7D40F3CAEF785E665D420222B17D84B64E64B92BD48CE9FB9A4EB08B514C4CCC7AB9C7B18C60115866FD0043CC155747BC0F0139C03F7B9F8FE6C16D2EC88AAD987673E982720C44C46399FFE9762D80B171FFE074DB96242E44F0000, N'6.1.3-40302')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201912112329260_Migration1', N'BibliotecaUPN.Web.Migrations.Configuration', 0x1F8B0800000000000400ED5CDB6EE336107D2FD07F10F4D416592BC9BEB481BD45D6498AA09B0BE264DBB7052DD18E5A8952452A7550F4CBFAD04FEA2F9492298AE24517CBB704415E628A1C0E67CE7086D4B1FFFBE7DFE18F8B30B09E6082FD088DECA3C1A16D41E4469E8FE6233B25B377DFDB3F7EF8FAABE1B9172EACCF45BFF7593F3A12E191FD48487CE238D87D8421C083D077930847333270A3D0015EE41C1F1EFEE01C1D39908AB0A92CCB1ADEA588F821CC3FD08FE308B930262908AE220F0698B5D327935CAA750D428863E0C291FDD19F067E44A00B1E6EAF07BFC0E9E0ECA36D9D063EA0BA4C6030B32D80504400A19A9E3C6038214984E693983680E0FE3986B4DF0C0418B2159C94DDDB2EE6F0385B8C530E2C44B9292651D851E0D17B661D471EBE928D6D6E3D6ABF736A67F29CAD3AB7E1C83E4D4994D8963CD3C93848B25E3AFB2E7D32C8471E58CAF3030E0B8A9EECEFC01AA70149133842302509080EACDB940E727F86CFF7D1EF108D501A04A29A5451FAACD2409B6E9328860979BE8333A6FCA5675B4E759C230FE4C38431CB955D22F2FED8B6AEE9E4601A408E02C10A13BA44F813443001047AB7801098A04C06CCEDA8CC2ECD751D85D304E262428A3C1A46B67505169F209A93C7914DFFB5AD0B7F01BDA28529F1807C1A7574104952589D67E8945EACF56DE99A951C5C3E78F372DD5C0F3805891F354F592FE6933F4D7A0B39C784867F4719D7E0C99FE7A6D0A9645B7730C89FE2473F5EEEA90236BEB04E174914DE45410550CB675F26519AB874DAFBC8D0E11E247348DAEBC52CDEA419EFA6D58D3DADD3AEE8A2D3AF751432FBAC1080F9C8B7D86BDE61D7BCC16A96148239441B9F264FA97DB7805B5A4B81DFB84DCE228A04D8631360158226D496C1CB9E973126342BC1253EEB1AF5E328A4A0C80212D7A853E9252B253C34A826F6E815F6A5A09562BF1CFEB6016C3C6BAE2983DFC3058936BE495C40F711F0E8A646BBA727A7BEBB44DF4AA12E239750D66564F5A912999A2EBD42936BB1425CB2B16F41591F4FB43B08379F976F01C67F4689B7F189B67B923BC53872FDDC15E236C7526D55D173E459357977A92E4F8F54658A493FA628A4F38EECEF9485EBE515F126C86379BF2AEFC896D17B83CE600009B44EDDE50DC818601778AAC5A92DBC6A0B053C4C32C481604C77141A423E226A74F8C8F5631098B59686B40CA94C252E5C7E72066388B26830DBBECDACBCE053A7E63348566A32CAD011D0530F2ACDC66CC242DD2E5D4242AC79DAE3AC667B1764F34D7BDF0067567F0BB833FBA5CDE442DDB31300AA157BFD5EA42DDF1B76B8B502A44E210D66BBC4438FCD4E6396AD6D791A0BB4999B97ED3BC19D727B65F2B2F92AAB74B278CBDA7ED333DE816D15CF2B81CEA4FA163067F2C78B825C53AEADBBA35C23EC5E62AE35ABBF5DF0ED7DAE5D9E2BE8184247C0A42837E3386B820BA239FBD2431B3BFE627656914194899C4022D6AED991A83CC3544F060A08ABE34B73EA6488F06E109407B64E06DB3F1B86572E0C1519620A6F10C43CAC93C2034A1221784F5A4F71AD2AF4D0DCBACA40AA3F0C72854B9B2950AC3FFE0912B8FBE548AFAEA9C57A75F743EAB29B0E2B6D8F2BC2122A9EAFB144CD01459056BABFB7453437D9261C188BE796E5F32A98D055BDEDCCBA822DD4378DAA29EAEBB976159DB080CACE54630D630DD768D47E76A88992A632A36DA1D1CF1AEB8D92E2968C6733FE6CE82CF940AC61E8188843C32B10C73E9A0B4422D6624D962CA2F1BB4977724DB894E1B858C3B1E1DAF299E87E09E6507A9A858B072FFC04933340C014645786632F54BA09B9DB90868A89AAE9597558919B8AFED9FF32C64A2ED5409B694A0B5ED04565F19EAF0FCA09421D6765242E108044733F3D8E823444E662CD3C9ADFCF8A2278A32A67E848EA2B25996227A5A0AD9ABD9553C458EAED18A144EAEE9DBAC19B719150008B426AEA62B32C7E961325190F786639055D461453B4ED0D68580AE98D176D6A6C0115C3B84D06B22E8EBB4829F81A153D585B7B29FC765E1463BCB237CBE1EF5A4539BC716F70565F4A76049B706EEA8EB8BAC19B81DDBA3694756E728C4E20CA614DED6530B280288335BD3AF8F2CAB237760D95730BE01A476E2AA516EFD9AB602B5A3BF898BF48AF3899B7BED04A4C393AC85DF8ECFC08211D1586AC6C6FFE228252C72FBBD81635D093EF6535FCE41913180EB20E83C91FC138F0E97ACB0E5700F93388C9921C621F1F1E1D4BDF64D89F6F1538187B81E6D8A37CB5A0EAAC2DD05BFCCCA48D04968E742989FF819E404277D1E49B102CBE1585AD87ADFF3A6CA6B0EAF259947BE74BE4C1C5C8FE2B1F75625DFEFA850F3CB06E121A1727D6A1F5775F3E7DDBC9D9B05E535759F8F9CCB5123A72C95F073CAAD4ED0E11A5D1B442CFEE254AA260B7450D1BD60B351225731644606DC03155D42F163D3B8CEE1DEF6B1596712FAC5798C41EF50B590393788DBB9DFE45F94B45AC4C8AEDE53A99F8DA4BD8FA8B9BD508ACEC95E75639A6D2BBAD5518B32B31194CB7EA9BA169BD2E322A7FFFB565CA8AEE8DF076F97EE69B890D324BF790DED29B4ABA33DEE8AE90D37E1BD82E6EF68695574F04DD2D684432D48A14C0FD064DEDABCC3D06CDFE67AA5D41678B99AA2378F68188A9723E64FF69B89666A6E5F2A6999EE1A619D496C57A5712660307533745578EA699A2A993DE95BDD940DED44DD19DDC59C7EDD4CDB07DE267052A0211A791D6A7D2D6F693DB2979A2F2DEAD1D8BD3C056DC5BE266B367B6BED035B3325759A6BA75C9C4A6BD245DAE0ADF752EB703A3527DFD4993A1F06B6D341B637F5E8AC87EBB0D41B79206799F4B348B8A842C69547491AEA6AE20011ECD91A709F167C025F4B10B31CEBF7CFD190429ED721E4EA177896E5212A7842E1986D3A0F20DF52CABD7CD9FD346AB3A0F6FE2FC470CD6B104AAA69F5DAEDEA08FA91F785CEF0BCDCDA84144562EB09BC8CC9724BB919C3F7349D7116A2988998F5739F7308C032A0CDFA0097882ABE8F680E1273807EE73F116DB2CA4D91155B30FCF7C304F4088998C723CFD4831EC858B0FFF03087716D9B4500000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Autor] ON 

INSERT [dbo].[Autor] ([Id], [Nombres]) VALUES (1, N'J. K. Rowling')
SET IDENTITY_INSERT [dbo].[Autor] OFF
SET IDENTITY_INSERT [dbo].[Biblioteca] ON 

INSERT [dbo].[Biblioteca] ([Id], [UsuarioId], [LibroId], [Estado]) VALUES (1, 1, 2, 3)
INSERT [dbo].[Biblioteca] ([Id], [UsuarioId], [LibroId], [Estado]) VALUES (2, 1, 4, 1)
SET IDENTITY_INSERT [dbo].[Biblioteca] OFF
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([Id], [LibroId], [UsuarioId], [Texto], [Puntaje], [Fecha]) VALUES (5, 2, 1, N'Bootdey is a gallery of free snippets resources templates and utilities for bootstrap css hmtl js framework. Codes for developers and web designers', 2, CAST(N'2019-11-12 00:00:00.000' AS DateTime))
INSERT [dbo].[Comentario] ([Id], [LibroId], [UsuarioId], [Texto], [Puntaje], [Fecha]) VALUES (6, 2, 1, NULL, 1, CAST(N'2019-12-11 18:37:24.600' AS DateTime))
INSERT [dbo].[Comentario] ([Id], [LibroId], [UsuarioId], [Texto], [Puntaje], [Fecha]) VALUES (7, 2, 1, N'asdasdasd', 4, CAST(N'2019-12-11 18:37:51.377' AS DateTime))
INSERT [dbo].[Comentario] ([Id], [LibroId], [UsuarioId], [Texto], [Puntaje], [Fecha]) VALUES (8, 2, 1, N'rgdfgdfg', 5, CAST(N'2019-12-11 18:39:26.380' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comentario] OFF
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([Id], [Nombre], [Imagen], [AutorId], [Puntaje]) VALUES (2, N'Harry Potter y la piedra filosofal', N'/Images/9788478884452.jpg', 1, 4)
INSERT [dbo].[Libro] ([Id], [Nombre], [Imagen], [AutorId], [Puntaje]) VALUES (4, N'Harry Potter y la cámara secreta', N'/Images/9788498382679.jpg', 1, 4)
INSERT [dbo].[Libro] ([Id], [Nombre], [Imagen], [AutorId], [Puntaje]) VALUES (5, N'Harry Potter y el prisionero de Azkaban', N'/Images/9788478884452.jpg', 1, 4)
INSERT [dbo].[Libro] ([Id], [Nombre], [Imagen], [AutorId], [Puntaje]) VALUES (6, N'Harry Potter y el cáliz de fuego', N'/Images/9788478884452.jpg', 1, 4)
INSERT [dbo].[Libro] ([Id], [Nombre], [Imagen], [AutorId], [Puntaje]) VALUES (7, N'Harry Potter y la Orden del Fénix', N'/Images/9788478884452.jpg', 1, 4)
INSERT [dbo].[Libro] ([Id], [Nombre], [Imagen], [AutorId], [Puntaje]) VALUES (8, N'Harry Potter y el misterio del príncipe', N'/Images/9788478884452.jpg', 1, 4)
INSERT [dbo].[Libro] ([Id], [Nombre], [Imagen], [AutorId], [Puntaje]) VALUES (9, N'Harry Potter y las reliquias de la Muerte', N'/Images/9788478884452.jpg', 1, 4)
INSERT [dbo].[Libro] ([Id], [Nombre], [Imagen], [AutorId], [Puntaje]) VALUES (10, N'Harry Potter y el legado maldito', N'/Images/9788478884452.jpg', 1, 3)
SET IDENTITY_INSERT [dbo].[Libro] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Username], [Password], [Nombres]) VALUES (1, N'admin', N'admin', N'Luigui Mendoza')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Biblioteca]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Biblioteca_dbo.Libro_LibroId] FOREIGN KEY([LibroId])
REFERENCES [dbo].[Libro] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Biblioteca] CHECK CONSTRAINT [FK_dbo.Biblioteca_dbo.Libro_LibroId]
GO
ALTER TABLE [dbo].[Biblioteca]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Biblioteca_dbo.Usuario_UsuarioId] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Biblioteca] CHECK CONSTRAINT [FK_dbo.Biblioteca_dbo.Usuario_UsuarioId]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comentario_dbo.Libro_LibroId] FOREIGN KEY([LibroId])
REFERENCES [dbo].[Libro] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_dbo.Comentario_dbo.Libro_LibroId]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comentario_dbo.Usuario_UsuarioId] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_dbo.Comentario_dbo.Usuario_UsuarioId]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Libro_dbo.Autor_AutorId] FOREIGN KEY([AutorId])
REFERENCES [dbo].[Autor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_dbo.Libro_dbo.Autor_AutorId]
GO