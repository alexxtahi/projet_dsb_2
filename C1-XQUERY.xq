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
      <title>Gestion des stocks</title>
      <link rel="stylesheet" type="text/css" href="{$stylePath}" />
    </head>
    <body>
      <h1>Résultat C1</h1>
      {
        if ($glossaire) then
          <div>
            <h2>Glossaire</h2>
            {
              if ($glossaire/@auteur) then
                <i>Réalisé par { string($glossaire/@auteur) }</i>
            }
            {
              for $mot in $glossaire/mot
              return
                <li>
                  { string($mot/@def) } : {$mot[text()]}
                </li>
            }
          </div>
      }
      <div>
        <h2>Catégories de produits</h2>
        {
          for $categorie in $categories
          return
            <div>
              <h3>Catégorie { string($categorie/@lib_cat) }</h3>
                {
                  for $produit in $categorie/produit
                  return
                   <ul>
                    <strong>{ $produit/nom_prod }</strong>
                    <li>Description : { $produit/descri_prod }</li>
                    <li>Prix dachat : { $produit/prix_achat_prod }</li>
                    <li>Prix de vente : { $produit/prix_vente_prod }</li>
                    <li>Quantité en stock : { $produit/qte_stock }</li>
                    <li>Date de péremption : { $produit/date_peremption }</li>
                    <li>Date dapprovisionnement : { $produit/date_appro }</li>
                   </ul>
                }
            </div>
        }
        </div>
    </body>
  </html>
)

(:~ Écriture dans un fichier ~:)
return file:write("~/public_html/resultatC1.html", $page)