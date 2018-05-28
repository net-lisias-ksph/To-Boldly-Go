# So...you want to use planet packs as templates for extrasolar planets.

To Boldly Go (TBG) is written so it will, by default, use the stock KSP planets and moons as templates when making extrasolar planets and moons. The user can easily extend it to use the bodies defined in planet packs, though. The feature has existed since 0.2.6 (06 March 2017), but it hasn't been documented until now. Everything should Just Work™ assuming the planet pack works with the latest version of Kopernicus. Here, I'll document the steps the user should take to make use of the feature.

In its most basic form, you will have to make some basic edits to a TBG file. More realistic generated galaxies will require a bit more editing, but nothing terrible. If you can use a text editor, you can do this.

**1. Find a planet pack**

* There are numerous planet packs out there that are in various states of maintenance. Some are actively being expanded, some are in stasis are are just being maintained, and others are long abandoned. One potential source of planet packs is listed [here](http://outer-planets.wikia.com/wiki/Planet_Packs), but there is no guarantee they will work well with the latest version of Kopernicus. For this tutorial, I recommend you take advantage of some [select packs](https://github.com/Sigma88/GN-PlanetPacks/releases) Sigma88 maintains and makes available for the Galactic Neighborhood mod.

* Here, we'll be using the [Trans-Keptunian](https://github.com/Sigma88/GN-PlanetPacks/releases/download/TransKeptunian/Trans-Keptunian.v0.5.zip) pack.

![](https://lh3.googleusercontent.com/JO5Y6Bpga9w4YhaZFVGAXH0jEWHVdAUtcdxDnoVncEZqyQY_lnEMBRJviFswGkQielpYSh8qlgQ3zvDW37d5CDpof6KnAoZ9bWpR1aLdcCRQSGCGHCaq83xt9hjBdsklFNhvX-TBSF0caNb5FD6_Vn8Xut8VpT_Ck1G_C6nuL0ERQB1T8gj6S9jwGVDHLZb4Y-H4TcMyKGSLaXcFsADAbhN-R425rEL7d5GMHf-iCVDb4nxyPwpzrIptMQ_o5svboBHAe7blGtLXZ3vFKEqkGfaMctMJNs3qgcbp4tp3-lhn6ye1ey3Hgm44ZOj7yLPOhEVVjSqQ_ZRmh-xp-zGK4bP8fACNCJk-_IPA_JCJyvKYQ3P8zs8xeFzt577A-Fe4qq0_t5NLC_Xrh1KszQCCk7Pa0OU-OWFgglQhLmdY-uJP4W6yRFO7DSHvIxFnwABvM-bW32gm9MPezpQQ-j2OlCc7yNi2SI283y5yfsyeE16fLnBSjM3D9aAqRu1P9PObNj2hPVVZ__3UC48muvOKPfn4BA_CaOQGeYgzlpTZ9KxGvPHeWQo-1mW65stNDbSxfOa0AYd6drqZW7BoiGD5fHWjRStU7fWy9lCDS4s=w1932-h1560-no)

**2. Install the planet pack like you would any mod**

* Unzip it into KSP's GameData folder, etc. Once installed, it should look something like:
![](https://lh3.googleusercontent.com/oumYG8o_2Pota547fnbBiQ_p39EdTn1cmc_U_sQTqsZucB4QVDr46nAc4IMM5cp4nbCPxpRMtOC2X4T7vApg0L_srO7T5kyZEYGP5wQ6cdD7GcXpnpxmvAUqc2g0swSqfcNUHm7WHQ4Cq1YWjSSI_RG1PO_gvSBXZpyUayOpOx9bVtPv_dWFawyn2JePthNjqUjf57-klBb1B1PYaX5vM1vIE1ud6BnFa6hl_tq4H2xHoiDOvhHeDJa6OlAQOml0GSSwSJk2yCAugzXPTMFzQBddrFsAlbjjTzX0A72DuPqKnajdq6P2IkNHOd2IaktmAHuc-ctQXC1tYjM5zw3DuLn_N6NTGDpPQwDzdkFoN9atxKUB1hc8brn8MqwYZTQDQfy41FfeIxLhdl71S8e7mFHzo0vHRM-5IiEUxr-tWZCsv4GHIrWns3KijjtHlgtU6VMbB_8HzhZiPFzVl_WtE4GF7R1R2NNQbjOZrt3PbJTfP-Rspwu7_IDix1aw4iDvXM-NASbxBXL9a60YsR4C3MlKm2QCeir1NHQ8wmQR21dcveGtT1t8S3wMx4ScDLcRm78MthYidL1j-9bDrO9ReWZv1NYkz7QYQphn7RE=w500)

**OPTIONAL: Make sure the planet pack works ok with KSP and the latest version of Kopernicus**

* Generating a galaxy that tries to use planets that are borken is just a recipe for frustration. To test whether the planet pack you grabbed is ok, launch KSP after you have installed the planet pack.
* Allow everything to load.
* Once KSP reaches the main screen, that means Kopernicus has finished loading all planets and you can check the log.
![](https://lh3.googleusercontent.com/QC8c1yCTJ41GEsEvO0_7zn7H5ZIBBQjAjX-4Z43VLNRqQwcIGnTcaBaE8MnMP3-kpB-nOq4FwTMG6LdGx3M4_jJ29Y0UXiAEaCjj6Jm2vi71sg5Y6ggmBbJirSFKEGW7t3K8eS_cbPyFHK4F9TESB-9QL0-9O_rA7NxK-cUR7lZ3ABxR8ZnVBEr4ipGV8ohuBYCRIhqsHGan5Z8LMFetvutLBGDS7p_1lkYSipHdtY2aNsA9TD4AILT9KcMOimw6AGLP0Y5VF3IqHQo4UgoUGnySNd62wE4Ot96BDSVK_R8ld4Q3wcHRFvvs-FGVp2BPzHuzTyzrPHsCChQfXLHJblkBQrRP2BrIEfVszx91uWOq8K_T82fvFqKAIUBr4Lcu7rTsF49kwvLqlsfneALtqGPdEHJ6fItvTGVcYd86bZ6JdsUGUFnwiEkuh57S7EkY-GY6pBDChieQddKlItI6TlZyt75EjSVIpnS-UuBCQ24vkHMnKLc-ODkMuw3iLWU_WXJPtXdnu88H3nDViEbZju9HXe4eqmXbETr74ohpWaMZ710oRtS2gm9HQGCyMQK9fGWie9fWnadrTZ4H12hIDESkDfx_i3Ds7ZAzdsg=w2128-h693-no)

* Opening the Kopernicus.log file will list all the bodies loaded. If there was a problem loading any of the bodies from the planet pack, there should be an error reported. Otherwise, everything should look ok, similar to the following:
![](https://lh3.googleusercontent.com/0XVQodICy5tfLfiXuxw9Gi1pGZ5gcjuo_cgmtHo4pFmzKSuoE0zmmNJr4Ot7g2lJDmxGuCqfTwXqRaCDhQkX7fqHPk-mmnF3NUAheO2DgKN7wdjnP1xUggPS4TVeit-cfpEy6uy-9cHZE6iz-8IGbCyVM2ncY1VbiteE0HzJnU6RGUiAc7tt7jx-FZRyPGVcHi5PAbSEomit4tYikGRtRv_BNM8qfTxSj4TUmUVRIu1SLt32CN7qYH1qPId3tH-CGLHANw0XEuJxmu4haZhJrq3M7xCI9doqQTdECDeFDSvakXo_cKIxfd4WRWDJh2YbQrkBuzt5TQE7NBa-WwtjrxqX4X5Fkuv-0ZlET0w4ERMAoeldCTZG-7tcJRtNfTizW_D2aOLTSUAEVJ29EHR-jQBlCbfPXmL1OJ7fx6xpR3EstSotWnjejvQJHfXr5ywH2MDSW1Djwuk9wxFU3yMNV1WhCW2SlGrKtyvDlzCHv5XLGp0JTo0rfGN-kgacf5Tvs_8NY-69GSy8TbePlcM7qSPsrbfXKDfJj_ySbu9NkEXRg6ZnfSFm8LWcVNEpz11q72HjB9CBp15_kK_DlbdknnMW4LvBPrA6I2F2Qqw=w1750-h1560-no)

**3. Open the "TBG_Planet_Templates.csv" file**

* Find the TBG_Planet_Templates.csv located in GameData/To-Boldly-Go/Data_Folder/

![](https://lh3.googleusercontent.com/cKVEJPgMOfiGoW4ELyso5Cax202MlfVXjp0VQqeYm7_KIwvaMCcmRLhziwOxaCilgc4VDxvm7S7usuKVf2Dzwt5fQPvsV3UZJD9CAx-F9n9X3gy_sS2uWbFWmsJj-iuMBkw1zGwXo6eHSm2vRULJVRS-pN6PkgPpB3vhgehjkLp-do5Del4loLHw9C5P0asyC183_sD9Z9lyaWyMUvJ89oklH3uirLcxjRH6dQn9H7zErwVHUEkvZ41Dakh5bnjINMvgfc5HYftPsfuqjU1uZV2zwnW7x-vfoHdSK9Hc6XkZymGiH-5ci217joSIHPNbFKuj7RO7UZwo6C5J5Dt_R-RBwPATxGjRCOaCsXbCOZ23vltfAmJLMtH2hVWubfEnIA2lbfsZg93Ro7dx_WCT-_CzbiDpRPyPC05nKtmzz512azz1ZbSApM5z7MYA1w7Zfyg0g236hWTid5LcgBl0dAqOTBYYbTrm7qcGN322TSRouiHh8vXBas_4brlUfdP3yJf6G0R1z_zLdu16bzw9QupzghoOnR9XPXQwF0uNKH7oH2zhh0P14uDb6KLQBArawDtkGUSgtbYknRjuTmRVPHRp_XqyajBd9BFCp44=w2158-h696-no)

* CSV files are "comma separated value" files that can be read by many editors, including things like Microsoft Excel, Google Sheets, and simple text editors.
* The values in the TBG_Planet_Templates.csv file have values related to whether a given planet is a KSP stock planet, the planet name, planet radius, planet mass, planet's SOI, and planet description.
* Not all of these parameters are absolutely necessary for TBG to function.
* The following shows the file open in Microsoft Excel:

![](https://lh3.googleusercontent.com/0BoEbHcKe3GfC70YVgndHIyGQEEJ7rVIzAyFrZiLK04VCB75yXj-7TVyu3Hcy7w-GZuuNfc9dPO_C8HELNew9zikrW3y40J7Fq7dwTNpl_1w1BeC2OmohnV-qrsa5cN6VsLq80NuzH275Wew2dYMnYxHWM_6NlrDXi7FjaarNpfySwr3mAOr2obRcKhS110RfXvFAupqPqOlnZ8ng_4Tubg5GzfJ6BEEkEopYQkNgvJkqtEtLisyCi8LMRtQFWRXh_1p_nsdXguVjHdXtef10S20zX5SD4SQ8D9A1LbDUTtZrpzg_suK94tbUvY3svlFArgp5LNGreINoJC2BizjU3EEPFPzHyyOfjYTyep_qHm8KWNn4FH73XDMx1EkyQd9zZBIa4PvZWK8hYGi0DFgVIPxNkhwz3Zft837JQ6qfi6gPz7NJsFxKVbE20Xui8WMhIo2qH9qb2HBXrA-TMLabvtK7m0ovzzKrqeviSMTiCjGams1rtD2zhRpb_Kd3Xo4RnMrwExxps8xRvMU6PTF-kVeqnAZkNHAoyZHT-qYZba7AD12trMCObu6Xf-zEFWNWBJ3JbLGvwzG5Amj7GzLsY49g-UiYV61mfE_IZA=w500)

**4. Add the new planets to the "TBG_Planet_Templates.csv" file**

* Following the same format, enter the new planets to the file.
* You can do this by opening the individual cfg files for each planet and getting the name, or if you did the optional step, you can use the names listed in the Kopernicus.log
* After editing the file, it should look similar to:

![](https://lh3.googleusercontent.com/WDtDjcEqkuwmt7GARX-YTgNT9mzulAkRe4QQH4FsBhLgYRNBDsRSh78cKvcz9GS_wOa8t-VYs18IvHirMpWxnIglguGynEroJaWPBe98a775P7MiFxDFRoqxW1Hg7Kj5gOylQVgGpbpk2u9PEZ8CqRy0oyYk9e9L211fL5vxe0fGCD5hjtw9mhXmW3tw2g8YdgYNXhuHaoz_GqYgqQUC8RtHkeog6rBRyLhPPJykRUt0mtncuhXuMHpoKR0xlb-ic-Mbq77YySwxXgXUVVO2Uv7qlpbGkasQgQ7S1Nu8tX19r29oCTnuE-eVw6jluMatoMMCi9kEmOOQZ6u8mzTlGrkSfPzw6ZNZycHw-T9SMWXwFAK7Nhn_fcj8rnPly7XGzeLJfA0B2zImc8siocTndJjXr_N7EeK8dnLEODwlzggu1eQxS6VRtUyf9JvoCQN-sUHbpqL7PWy3n-CQp8CjnBSQGxbzEFpBlJN7mXZ9t3-uU7MtoYH6FDOUE8nml_TJEjtA8eY4RBXdqCm0yh4-rWqbikryTTZfnr41x9d2YQ2LDa0ZIstMRONV_ZfzPQ9TwUNmmM-CIluBDe2nSapuxmp9MqsKAdKvVJVRxL0=w2224-h1454-no)

* Note that the planets from the planet pack are all marked as FALSE in the **Stock** column, and that the **radius**, **mass**, and **SOI** columns are blank.
* When left blank, the bodies the TBG will make based on these bodies will inherit the **radius**, **mass**, and descriptions from the original bodies. TBG will calculate the SOI of each body on creation. The **description** column is marked with a "" to tell TBG that the description should be cleared and TBG should generate a generic description of the body's orbital characteristics.
* If you want _all_ bodies based on one of the templates in TBG_Planet_Templates.csv to have the same description, you can enter it here. 

**IMPORTANT NOTE: Some editors might introduce additional, spurious quotation marks when saving the file.**

* You can open the TBG_Planet_Templates.csv with a text editor to make sure there are not multiple quotation marks, and if there are, remove them.
![](https://lh3.googleusercontent.com/hU7t5AxzMgS2ALQtGpq7yREwBjsv6xroK3TzXZmd_a-TJhEx3Jra5EMsJhjZ0sitO1TVOYjdEU2z0r3BCrPHd-2_zhnklldb_aSXSUUbRzy2042ORrmcxd-xRBfhP2JHp3-5cW52ONZn8coqkghK-GGmqdX3dtQAR6kPu_7TDP-rfzNe6MdA-TdWSKo3Uqp-RKjXA3Pdmb9SRoN6rY420da8UIpEAlvYsrceVPEQB4XXHYvpphNXq0dTd1-NmHKmJ1IzJIoTSpel1m30dEm2QwYHVtkwns22U1NHMozblDnGFmwVoJAnAHoDrHKwxa2Zp6mSUcJWuBzyM6zxy6d-ASebphu9WYFhSkCtakkJoth5XDWpQMYVUJ_LMMS-nUDsufoZ9A0-NOG3zvs26m9tBOZqhhlD8nUsFDmIRhBjE0ufmYdmqzmFi6-TtiGnm56C9y1TTqHT5rw01nYdWkiAc3jTnWR2WDWLPgt8gQkEs2dJppz7uZn6RqzBRizt0ocFRZaXbveiTdWStkUlBekZrtLxSDAQWzwtj5VXWHRnmZ5fsWInQJmBmYANN51ILTGQTHbOWREnL9E4Sc_YRw0wGKpatGtz7eYwrMlQwvI=w1750-h1560-no)

**5. Use the GalaxyGen.exe to generate a galaxy**
* Now that the TBG_Planet_Templates.csv file has been edited, you can launch the GalaxyGen.exe
* Mac OS users should note that I am doing so using a WineSkin.
![](https://lh3.googleusercontent.com/kFE1GSLDo-3lKRfoj-5VZa2ksNKn3l4CgVrmANNTxUI62eM4ldudzjuoscjkGc8ex3SDhhuIFp5Z6aLc3Rc67iqOu5n4KCXkRpRQNp2AzsbvhEe9N_sdxGR5tAAuT6keo4jaw9ZDq8GF7nlF1TrnOFrPIZW22XKSZKZgjy-xFSirt0Aj-ektKG7B5XNxXo3gEJjxTcQQy8ok8_fYJagStuucxXkq09yE4A0ARczonzHC07etc2SBtdSThAgM4zbpnF56oOU4poAI7MbgxXuA67KqUAP6qbd09uwSPFdFO4cIcreXsuve-UEogkuBQPnTJzmhbUg6lFCOdUTARdMlkMHLSw0Ns0JwNFE96ewl3cBf-9sUJWoj13RwaAkRHSqpq8bFfImsc1tJ9yCj5LaxJnOBu2l92jj3C6ZB4E0mgfAbVLZbXyV9AFtYQCo9Y8wJIf-Wc44db7AAE7o8YvpHj6i_5baKRK7I67fImyXbAsg5e5vlopYubTudPP_enycWKxTVIubbvcpcN1yzCmSPM5deEi1if3D4qJfNp59SLarIc--zBKgmBDAIpNdHK1JDaT379SGFy0x3-U6mYBkiupcypzmIRNR32I1jmDk=w500)
![](https://lh3.googleusercontent.com/xfvI3tZiM7XlWE7ReTCDv-obYljtYuj3DMALIDnyJo7TvLDjeoDrlbY_zfCZEMUjPFiwDnWXheAG_cQ-C4yElnzocgH8nFbwDMruKYPiNUlcxMsuDBPAeOi3gSYRipkYkNWBDJrUeljzAqMprekKdXSyYEVTfkJJM_gCFwJ_PRXy5XJI4UGTIOfaDfZNHd-XZ2IXjIrRcvT8NK_tTKF7zA0lMcEx1pcRpWrAcWZz3-Os0jAr1-4SchbBZOl7D7ZIZi8NqiTwv5GlrJBR5nxB6cPkY327IMR_eeaGeoqKf29erTrJqQCEcT_FnlUaFjHEdgml38FgvpFlK1aZp1uHTBFKLibnIQAXe5l4UE_cV_9X7mkgXkLyrlA0JyMYyL7T0yIhkG7_VIdKCXHmYV5WV-jbCyJ4YNBFhcmZjoEWEJgsIMLwr8mFOp_Yvmwc01o1kQKWd5Y8bzU5KAi80UwOyetRFfzGOQtK_HVzN2Lxg_z21VfOov02EsA7TpQGZD-v2Pal7BY_H5FUQ52Vx77w24vI0WRAivDk8GbE_r2OCD6VSWdpood3qppn5R_YGirqHCh4ftpKRqqSlbfvu2LcCluINxTp91oLkqjIU8A=w500)

**6. Launch KSP and check out your galaxy**
* Once you launch KSP, you should be able to see the changes that the planet pack introduces. In this example, the Trans-Keptunian pack introduces several new bodies beyond Eeloo.

![](https://lh3.googleusercontent.com/jMXlogUO89YsFCZX4urnNqF17k9LlkISbBF2RAJdzJK_nFFzqOcG6WLSmXSAG3ORY0m5kL5yRhIj0BaQb1Eow_ZYuPm5D-q61PkQC7IsmGC-u50YxBlGp5i46BZcEgf6cPI-mY_Dhifrg4qCKKIlhCOadtIEYgvW8sCfNGmBsvHH1VouarPB9dbQItPqocX-neVnL8ae2va2Hhu-0inUfEzuEX3xx0rEJeDK_XQZ9VoUQZHvr4vBLQ9RtUOfh4NQ4N5tP6VkG8KC7raJHPcQg6Zu2xg5fsu9nmEkJeE0UDBvcXS6q19rGe3XmfkhFDvnxvhvOsYA6SVx2E3s5NoPY7e3_KOFv_hlf3pOy9pisnM2Yg2tXugPzygCUe8WKVCDJbJD4H-owQMPtrj1CPsrBq3n-Wru3wA5XLyi0Wcx399-skEEsoMAf8OtS6TzzIoYIB5K4C5XYtGCuSBhqlryELaxubZyTym-3o12rd2ggzPw02djjb8BWumSlJAXLcT-JDw_n6WrFFqO_m1RBhwQ-QqmPt3XaDejdWz9VVPPe0VYxjc89i0PppqEmT7LsGiqrXWc3efHilhC0BcQjDfBalHaYKlYKmKGOl49tvQ=w500)
* In the wider universe you should be able to find examples of bodies from the planet pack. Here, we can see a moon based on Putto in orbit around a planet based on Eve:

![](https://lh3.googleusercontent.com/je6vkkE33nUkvx8wuV7lXmg50QKvQPS8_CPUcP9yOm8BelpmWGSmddJyG1IfN5IQzaELegW3eJraCgcsxcbPhW7Baf75Th8eBab81DXLttwG_UMn0KBBnieDVcaS_yHn4AcMPoIzFNnckY6aL60LOLC3E4ixgcqWLVy8_pD_wvcB7ukI1SRNswT8dvPBD7dyFkSWL9Ik7UM4JJAkT-LoTIuSjywTyAnQpBP04T6Vu3oCVn8qf3hKnQpFgaGY9DNB1CZ-uBcyJhY5EA7Am7RQMpbWj08cBajlf7q81gpNyFboJ3y-g8ba4F00_FwGj3IK4DIWQEJBiXS2JHSxSjzqRLa01Y_HZTLnyfgWQiWzCX-KRUgPUJOQ3cHxTZxYair4eK97IS1qBjzSv4qxDnRpqIuROivkP4BluVcVS4YKDgTkQ8OgQuW_B8K9DjsSDuoq-5aRCQotprQKp227ObagoMTkOKZZbMCipiSjgaVjmALKaLjtntHvx5J7d27a7zweqXdGzFXgFPibY_uH1RB9nvpgteYkvKUGlh6TN9hvc6GhC3-CDh56mYsWGxLG0nbcieXdOi0Yi58sVeA2qqPfdlS71AfkApdz0iqGoQY=w500)

**MORE ADVANCED STEPS**
* TBG uses the radius of planets to determine what body should have moons. For example, it doesn't make sense for a Gilly-sized planet to have a moon that has the size of Eve. To work this out, TBG needs **radius** information to be entered in the TBG_Planet_Templates.csv file. 
* This information is relatively easy to find in the cfg files of the planet pack, as below:

![](https://lh3.googleusercontent.com/6VmknavlanjukOFVJw291KTqSo-8fO6zqRlYMh3kKfzMSPAIUAm1_oPlE319FsG0PaOHt5AqMA2nF11usKb-IJO-JpghpmCL6h3QR0odSfS1eP2DHGlgqXmcNC7IU255NaPGzAcOkGK9c9xbHYVhANGWsGLVuTh5SmyV6WlO0J8odg034TQO-wy56aIKDj5xyCn0YwLGWaDkr3xFuqvDJNmZ8nK2uQ-PV4pHtWdlB78LneXXyhLVzsGwJ10uzVdjaZL7esxUSqRDE1iY0on4dKZFFRE8XBFQqEFIKm9fNYN02c0VvB8XqtPwIdInNIOaRlHB2pzua3d43XK1Wh0xeJ7_8ILs2Y05pG3P-Ec5M5QdNZNOtwxsYXxElb0o3jyR2Zyk0uGCD27zeXTfiEjS4ppPnm0Rm6xKypz3uQ492vMCRmUAYnTMOFqNpawaQHiDKdZq1X0DgHaDN5UMj7ZKTTAdgPbNGvhpS2MRdkYeFZPj0nfby7BHYtvCjgCA3No2gkszeodTpvUyonoMfmtS1Dd1BW5No7dcBCC7rMn_GIQ4tSv5XVWfU3ODgLTjBLSCK6fnqZCSrNKluUiRPqC9V9sKLOpfFrIgZHKZeVc=w500)
* Entering the radii for the bodies will help TBG make more realistic determinations of what should orbit what.