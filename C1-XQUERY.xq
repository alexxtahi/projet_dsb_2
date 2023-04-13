xquery version "1.0";

(:~ Les variables ~:)
let $stylePath := "./Q10a-XML.css"
let $xml := doc("./Q8a-XML.xml")
let $stock := $xml/stock
let $glossaire := $stock/glossaire
let $categories := $stock/categorie

(:~ Génération de la page ~:)
let $page := (
  <html>
    <head>
      <link rel="stylesheet" type="text/css" href="{$stylePath}" />
    </head>
    <body>
      <h1>Stock dun supermarché</h1>
      <ul>
        {
          for $categorie in $categories
          return
            <li>
              { $categorie/@lib_cat }
              <ul>
                {
                  for $produit in $categorie/produit
                  return
                    <li>
                      { $produit/nom_prod }
                      <ul>
                        <li>Description : { $produit/descri_prod }</li>
                        <li>Prix dachat : { $produit/prix_achat_prod }</li>
                        <li>Prix de vente : { $produit/prix_vente_prod }</li>
                        <li>Quantité en stock : { $produit/qte_stock }</li>
                        <li>Date de péremption : { $produit/date_peremption }</li>
                        <li>Date dapprovisionnement : { $produit/date_appro }</li>
                      </ul>
                    </li>
                }
              </ul>
            </li>
        }
      </ul>
      <h2>Glossaire</h2>
      <ul>
        {
          for $mot in $glossaire/mot
          return
            <li>
              { $mot/@def }
              <ul>
                <li>Auteur : { $glossaire/@auteur }</li>
              </ul>
            </li>
        }
      </ul>
    </body>
  </html>
)

(:~ Écriture dans un fichier ~:)
return file:write("./pageWeb.html", $page)