# -*- coding: utf-8 -*-
# frozen_string_literal: true
module DecidimHospitalet
  module Surveys
    # A form object to be used when public users want to anser a survey.
    class Towns
      TOWNS = {
        "800180001" => "Abrera",
        "800230008" => "Aguilar de Segarra",
        "801420002" => "Aiguafreda",
        "800390004" => "Alella",
        "800570005" => "L'Ametlla del Vallès",
        "800600000" => "Arenys de Mar",
        "800760009" => "Arenys de Munt",
        "800820002" => "Argençola",
        "800950006" => "Argentona",
        "801090004" => "Artés",
        "801210007" => "Avinyó",
        "801370005" => "Avinyonet del Penedès",
        "801550006" => "Badalona",
        "890450006" => "Badia del Vallès",
        "801800000" => "Balsareny",
        "825200000" => "Barberà del Vallès",
        "801930008" => "Barcelona",
        "802070005" => "Begues",
        "802140003" => "Bellprat",
        "802350006" => "Bigues i Riells",
        "802530008" => "El Bruc",
        "802720002" => "Les Cabanyes",
        "802880001" => "Cabrera d'Anoia",
        "802910007" => "Cabrera de Mar",
        "803050006" => "Cabrils",
        "803120002" => "Calaf",
        "803330008" => "Caldes de Montbui",
        "803270005" => "Caldes d'Estrac",
        "803510007" => "Calella",
        "803860009" => "Callús",
        "803640003" => "Calonge de Segarra",
        "803990004" => "Campins",
        "804030008" => "Canet de Mar",
        "804100000" => "Canovelles",
        "804250006" => "Cànoves i Samalús",
        "804460009" => "Capellades",
        "804620002" => "Cardedeu",
        "804780001" => "Cardona",
        "804840003" => "Carme",
        "805170005" => "Castellar del Vallès",
        "805380001" => "Castellbell i el Vilar",
        "805430008" => "Castellbisbal",
        "805690004" => "Castelldefels",
        "805810007" => "Castellet i la Gornal",
        "806080001" => "Castellfollit de Riubregós",
        "805940003" => "Castellfollit del Boix",
        "806150006" => "Castellgalí",
        "806200000" => "Castellnou de Bages",
        "806360009" => "Castellolí",
        "806540003" => "Castellví de la Marca",
        "806670005" => "Castellví de Rosanes",
        "826650006" => "Cerdanyola del Vallès",
        "806890004" => "Cervelló",
        "806920002" => "Collbató",
        "807130008" => "Copons",
        "807280001" => "Corbera de Llobregat",
        "807340003" => "Cornellà de Llobregat",
        "807520002" => "Dosrius",
        "807650006" => "Esparreguera",
        "807710007" => "Esplugues de Llobregat",
        "813470005" => "Figaró-Montmany",
        "808110007" => "Fogars de Montclús",
        "808470005" => "Fonollosa",
        "808500000" => "Font-rubí",
        "808630008" => "Les Franqueses del Vallès",
        "809020002" => "Gaià",
        "808790004" => "Gallifa",
        "808850006" => "La Garriga",
        "808980001" => "Gavà",
        "809190004" => "Gelida",
        "809450006" => "La Granada",
        "809610007" => "Granollers",
        "809770005" => "Gualba",
        "810170005" => "L'Hospitalet de Llobregat",
        "816290004" => "Els Hostalets de Pierola",
        "810220002" => "Igualada",
        "810380001" => "Jorba",
        "810430008" => "La Llacuna",
        "810560009" => "La Llagosta",
        "810750006" => "Lliçà d'Amunt",
        "810810007" => "Lliçà de Vall",
        "810690004" => "Llinars del Vallès",
        "811080001" => "Malgrat de Mar",
        "811360009" => "Manresa",
        "824230008" => "Marganell",
        "811410007" => "Martorell",
        "811540003" => "Martorelles",
        "811890004" => "El Masnou",
        "811920002" => "Masquefa",
        "812060009" => "Matadepera",
        "812130008" => "Mataró",
        "812280001" => "Mediona",
        "812340003" => "Molins de Rei",
        "812490004" => "Mollet del Vallès",
        "812710007" => "Monistrol de Montserrat",
        "812520002" => "Montcada i Reixac",
        "812650006" => "Montgat",
        "813320002" => "Montmaneu",
        "813500000" => "Montmeló",
        "813630008" => "Montornès del Vallès",
        "813790004" => "Montseny",
        "813980001" => "Mura",
        "814020002" => "Navarcles",
        "814190004" => "Navàs",
        "814300000" => "Òdena",
        "814580001" => "Olèrdola",
        "814610007" => "Olesa de Bonesvalls",
        "814770005" => "Olesa de Montserrat",
        "815210007" => "Orpí",
        "815370005" => "Òrrius",
        "815420002" => "Pacs del Penedès",
        "815550006" => "Palafolls",
        "815680001" => "Palau-solità i Plegamans",
        "815740003" => "Pallejà",
        "890580001" => "La Palma de Cervelló",
        "815800000" => "El Papiol",
        "815930008" => "Parets del Vallès",
        "816140003" => "Piera",
        "816350006" => "Pineda de Mar",
        "816400000" => "El Pla del Penedès",
        "816530008" => "La Pobla de Claramunt",
        "816720002" => "Polinyà",
        "818250006" => "El Pont de Vilomara i Rocafort",
        "816880001" => "Pontons",
        "816910007" => "El Prat de Llobregat",
        "817050006" => "Els Prats de Rei",
        "823030008" => "Premià de Dalt",
        "817270005" => "Premià de Mar",
        "817480001" => "Puigdàlber",
        "817640003" => "Pujalt",
        "817860009" => "Rajadell",
        "817990004" => "Rellinars",
        "818030008" => "Ripollet",
        "818100000" => "La Roca del Vallès",
        "818460009" => "Rubí",
        "818590004" => "Rubió",
        "818780001" => "Sabadell",
        "819180001" => "Sallent",
        "819440003" => "Sant Adrià de Besòs",
        "819600000" => "Sant Andreu de la Barca",
        "819760009" => "Sant Andreu de Llavaneres",
        "819820002" => "Sant Antoni de Vilamajor",
        "820090004" => "Sant Boi de Llobregat",
        "820370005" => "Sant Cebrià de Vallalta",
        "820210007" => "Sant Celoni",
        "820420002" => "Sant Climent de Llobregat",
        "820550006" => "Sant Cugat del Vallès",
        "820680001" => "Sant Cugat Sesgarrigues",
        "820740003" => "Sant Esteve de Palautordera",
        "820800000" => "Sant Esteve Sesrovires",
        "821070005" => "Sant Feliu de Codines",
        "821140003" => "Sant Feliu de Llobregat",
        "821290004" => "Sant Feliu Sasserra",
        "820930008" => "Sant Fost de Campsentelles",
        "821350006" => "Sant Fruitós de Bages",
        "819390004" => "Sant Iscle de Vallalta",
        "821880001" => "Sant Joan de Vilatorrada",
        "821720002" => "Sant Joan Despí",
        "822120002" => "Sant Just Desvern",
        "822270005" => "Sant Llorenç d'Hortons",
        "822330008" => "Sant Llorenç Savall",
        "822640003" => "Sant Martí de Tous",
        "822700000" => "Sant Martí Sarroca",
        "822860009" => "Sant Martí Sesgueioles",
        "822990004" => "Sant Mateu de Bages",
        "823250006" => "Sant Pere de Riudebitlles",
        "823460009" => "Sant Pere de Vilamajor",
        "818970005" => "Sant Pere Sallavinera",
        "823590004" => "Sant Pol de Mar",
        "823620002" => "Sant Quintí de Mediona",
        "823840003" => "Sant Quirze del Vallès",
        "824010007" => "Sant Sadurní d'Anoia",
        "809830008" => "Sant Salvador de Guardiola",
        "826280001" => "Sant Vicenç de Castellet",
        "826490004" => "Sant Vicenç de Montalt",
        "826340003" => "Sant Vicenç dels Horts",
        "824440003" => "Santa Coloma de Cervelló",
        "824570005" => "Santa Coloma de Gramenet",
        "824820002" => "Santa Eulàlia de Ronçana",
        "824950006" => "Santa Fe del Penedès",
        "825080001" => "Santa Margarida de Montbui",
        "825150006" => "Santa Margarida i els Monjos",
        "825670005" => "Santa Maria de Martorelles",
        "825730008" => "Santa Maria de Miralles",
        "825920002" => "Santa Maria de Palautordera",
        "826060009" => "Santa Perpètua de Mogoda",
        "826130008" => "Santa Susanna",
        "819230008" => "Santpedor",
        "826710007" => "Sentmenat",
        "827320002" => "Subirats",
        "827470005" => "Súria",
        "827630008" => "Tagamanent",
        "827790004" => "Talamanca",
        "828190004" => "Teià",
        "827980001" => "Terrassa",
        "828240003" => "Tiana",
        "828450006" => "Tordera",
        "828610007" => "La Torre de Claramunt",
        "828770005" => "Torrelavit",
        "828830008" => "Torrelles de Foix",
        "828960009" => "Torrelles de Llobregat",
        "829000000" => "Ullastrell",
        "829170005" => "Vacarisses",
        "829220002" => "Vallbona d'Anoia",
        "829430008" => "Vallgorguina",
        "829560009" => "Vallirana",
        "829690004" => "Vallromanes",
        "829750006" => "Veciana",
        "830150006" => "Viladecans",
        "830080001" => "Viladecavalls",
        "830540003" => "Vilafranca del Penedès",
        "830670005" => "Vilalba Sasserra",
        "830200000" => "Vilanova del Camí",
        "890240003" => "Vilanova del Vallès",
        "821400000" => "Vilassar de Dalt",
        "821910007" => "Vilassar de Mar",
        "830410007" => "Vilobí del Penedès",
      }.freeze
    end
  end
end