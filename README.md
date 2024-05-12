P175B314 PROGRAMAVIMO INŽINERIJOS MODULIO TECHNOLOGINIS PROJEKTAS

Komanda DEA 

Projekto pavadinimas BLAZE RUNNER

Blaze runner - tai 2D kovinis veiksmo žaidimas, skirtas vienam žaidėjui. Žaidimo tikslas yra pereiti lygius, siekiant surinkti kuo daugiau taškų ir pagerinti asmeninius rekordus. Šis žaidimas skirtas Windows operacinėms sistemoms.

Techninis aprašymas
Žaidimas kurtas naudojant atvirojo kodo žaidimų kūrimo variklį „Godot“. Projekto valdymui bei komandos darbui naudota „Jira“, bedravimui „Discord“ platforma.

Pagrindinis projekto techninis reikalavimas - sukurti pilnai veikiantį 2D žaidimą, kuriame žaidėjas galėtų rinkti taškus eliminuodamas skirtingų tipų priešus. Pagrindinės įgyvendintos užduotys:

Meniu su atitinkamais mygtukais: Play, Exit Lygio pasirinkimo meniu Ginklų pasirinkimo meniu

Pilnas ir išsamus techninių užduočių sąrašas (backlog) čia.

Architektūra
Paleidus žaidimą, yra sukuriami du objektai: pagrindinio meniu klasės ir globalių kintamųjų klasės. Kadangi įvairūs objektai yra sukuriami ir ištrinami programos vykdymo eigoje, globalių kintamujų klasė yra žaidimo informacijos saugykla, kurią galimą pasiekti iš bet kurio objekto. Globalių kintamųjų klasėje saugoma informacija apie žaidėjo surinktus taškus, turimus ginklus ir jų amuniciją. Šioje klasėje taip pat yra metodai, skirti žaidėjo taškų saugojimui į diską ir užkrovimui iš disko. Pagrindinio meniu klasė atvaizduoja mygtukus, skirtus uždaryti programą arba pradėti žaidimą. Paspaudus mygtuką pradėti žaidimą, yra inicializuojama lygio pasirinkimo klasė, kuri atvaizduoja lygių pasirinkimo meniu. Jame paspaudus ant atitinkamo lygio mygtuko, globalių kintamųjų klasėje yra išsaugoma, kurį lygį reikės užkrauti. Taip pat yra vykdoma ginklo pasirinkimo klasė. Ši klasė atvaizduoja meniu, kuriame rodoma, kokius ginklus galima pasirinkti ir kokie jau pasirinkti. Pasirinkus atitinkamą ginklo mygtuką, globalių kintamųjų klasėje pasirinkimas išsaugomas. Paspaudus mygtuką pradėti lygi, yra vykdoma atitinkamo lygio klasė. Lygyje yra žaidėjo, priešų ir kiti objektai. Žaidėjo klasėje aprašyta jo judėjimo, ginklo pasirinkimo, gyvybės taškų praradimo logika. Šaudimo logika aprašyta konkretaus ginklo klasėje, kadangi kiekvienas ginklas daro skirtingą kiekį žalos ir šaudo kitaip. Priešo klasėje aprašyta žaidėjo sekimo, šaudimo logika. Žaidėjui pasiekus lygio galą yra kviečiamas globalių kintamųjų klasės metodas, skirtas išsaugoti žaidėjo taškus. Taip pat inicializuojama “lygio pabaigos” klasė. Ji, nuskaitydama duomenis iš žaidėjo taškų masyvo, jais užpildo taškų lentelę. Šioje klasėje taip pat aprašyta trijų mygtukų logika: perėjimo į kitą lygį paspaudus ant “eiti į sekantį lygį” mygtuko, pagrindinio meniu užkrovimo ir to pačio lygio perkrovimo.
