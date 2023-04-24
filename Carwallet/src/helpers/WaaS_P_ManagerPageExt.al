pageextension 50303 Financingsolution extends 9022
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {


        addlast(Sections)
        {
            group("Wallet")
            {
                group(Wallets)
                {
                    action(WalletQ)
                    {
                        CaptionML = ENU = 'Walletlist',
                                DEU = 'Walletliste';
                        RunObject = page waas_P_List;
                        ApplicationArea = All;

                    }
                    action(Custom)
                    {
                        CaptionML = ENU = 'Business Customers',
                                DEU = 'Geschäftskunden';
                        RunObject = page waas_P_Companies;
                        ApplicationArea = All;

                    }
                    action(PrivatIndi)
                    {
                        CaptionML = ENU = 'Privat Customers',
                                DEU = 'Privatkunden';
                        RunObject = page waas_P_Persons;
                        ApplicationArea = All;

                    }
                }
                group("SettingsG")
                {
                    CaptionML = ENU = 'Settings',
                                DEU = 'Einstellungen';
                    // Creates a sub-menu
                    action("Settings")
                    {
                        ApplicationArea = All;
                    }
                    action(Product_and_Services)
                    {
                        CaptionML = ENU = 'Product & Servcie Family',
                                DEU = 'Product & Service Gruppen';
                        ApplicationArea = All;
                        RunObject = page waas_P_vItemGroups;
                    }
                    action(Product_Groups)
                    {
                        CaptionML = ENU = 'Product & Service',
                                DEU = 'Produkt & Service';
                        ApplicationArea = All;
                        RunObject = page waas_P_vItems;

                    }
                    action(Preise)
                    {
                        CaptionML = ENU = 'Abo|Package Pricing',
                                DEU = 'Abo|Paket Preise';
                        ApplicationArea = All;
                        RunObject = page waas_P_vItems_price;
                    }

                    action("Demo Installer")
                    {
                        RunObject = codeunit waas_Installer;
                        ApplicationArea = All;
                    }

                }

            }
        }
    }

}