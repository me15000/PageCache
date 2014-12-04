using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;

namespace PageCache.Setting
{
    public class Rules
    {
        Setting setting;
        public Setting Setting
        {
            get { return setting; }
        }

        List<Rule> rules;

        public List<Rule> Items
        {
            get { return rules; }
        }

        public Rules(Setting setting)
        {
            this.setting = setting;

            int c = setting.Config.Rules.Count;
            rules = new List<Rule>(c);
            for (int i = 0; i < c; i++)
            {
                rules.Add(new Rule(this, setting.Config.Rules[i]));
            }
        }


        public Rule Get(HttpContext context)
        {
            for (int i = 0; i < rules.Count; i++)
            {
                Rule rule = rules[i];

                if (rule.IsMatch(context))
                {


                    return rule;

                }
            }

            return null;
        }

    }


    public class Rule
    {

        Regex matchRegex;
        public Regex MatchRegex
        {
            get { return matchRegex; }
        }


        Regex skipRegex;
        public Regex SkipRegex
        {
            get { return skipRegex; }
        }


        Config.Rule configRule;
        public Config.Rule ConfigRule
        {
            get { return configRule; }
        }


        Rules rules;
        public Rules Rules
        {
            get { return rules; }
        }


        Setting setting;
        public Setting Setting
        {
            get { return setting; }
        }


        public Rule(Rules rules, Config.Rule configRule)
        {
            this.rules = rules;

            setting = rules.Setting;

            this.configRule = configRule;

            matchRegex = new Regex(configRule.Match, configRule.IgnoreCase ? RegexOptions.IgnoreCase : RegexOptions.None);

            if (configRule.Skip != null)
            {
                skipRegex = new Regex(configRule.Skip, configRule.IgnoreCase ? RegexOptions.IgnoreCase : RegexOptions.None);
            }

        }


        public bool IsMatch(HttpContext context)
        {
            if (skipRegex != null)
            {
                if (skipRegex.IsMatch(context.Request.Path))
                {
                    return false;
                }
            }

            return matchRegex.IsMatch(context.Request.Path);
        }


        public List<Store.IStore> GetStores()
        {
            List<Store.IStore> stores = new List<Store.IStore>();
            if (!string.IsNullOrEmpty(configRule.StoreName))
            {
                stores.Add(rules.Setting.Stores.Get(configRule.StoreName));
            }
            else
            {
                foreach (Store.IStore item in rules.Setting.Stores.Items.Values)
                {
                    stores.Add(item);
                }
            }

            return stores;
        }


        public Store.IStore GetStore()
        {
            if (!string.IsNullOrEmpty(configRule.StoreName))
            {
                return rules.Setting.Stores.Get(configRule.StoreName);
            }
            else
            {
                //return rules.Setting.Stores.Get("default");
                return rules.Setting.Stores.GetRandom();
            }



        }



        public Host Host
        {
            get
            {
                return setting.Hosts.Get(configRule.Host);
            }
        }

    }
}
