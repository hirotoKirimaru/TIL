<template>
  <div class="hello">
    <input type="button" value="えい" @click="click">
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import { load } from 'recaptcha-v3';
import axios from 'axios';

interface ReCAPTCHAResponse {
  success: boolean;
  challengeTs: string;
  hostname: string;
  errorCodes: [];

}


@Component
export default class Login extends Vue {
   private token = '';

   private result: ReCAPTCHAResponse = {
     success: false,
     challengeTs: '',
     hostname: '',
     errorCodes: [],
   };

  // ここに発行したsite keyを設定
  private clientSecret = '';

  // ここでreCAPTHCAのチェックレベルを設定
  private action = 'homepage';

  private error = {};

  private async click() {
    console.log('クリック開始');
    // モジュールを使ってtokenを取得する
    const recaptcha = await load(this.clientSecret);
    this.token = await recaptcha.execute(this.action);
    console.log({ token: this.token });

    // tokenを用いてCloud FunctionsのAPIを実行する
    await this.server({ token: this.token })
      .then(async (response) => {
        this.result = (await response) as ReCAPTCHAResponse;
      })
      .catch((error) => {
        this.error = error;
      });
  }

  // eslint-disable-next-line class-methods-use-this
  async server(token: any): Promise<{}> {
    console.log('server');
    // ここに発行したsecret keyを設定
    const serverSecret = '';

    let response = {};

    const headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
      'Access-Control-Allow-Headers': '*',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    const config = {
      headers,
      withCredentials: true,
    };

    const params = new URLSearchParams();
    params.append('secret', serverSecret);
    params.append('response', token);

    const url = 'https://www.google.com/recaptcha/api/siteverify';
    // const url = 'https://recaptcha.google.com/recaptcha/api/siteverify';

    await axios.post(url, params, config)
      .then((res: any) => {
        console.log('then');
        console.log(res);
      })
      .catch((err) => {
        console.log('error');
        console.log(err);
      })
      .finally(() => {
        console.log('finally');
      });
    response = {
      success: false,
      challengeTs: '',
      hostname: '',
      errorCodes: [],
    };

    return response;
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
